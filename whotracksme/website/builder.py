#! /usr/bin/env python
# -*- coding: utf-8 -*-


import concurrent.futures
import os

from pathlib import Path
from whotracksme.data.loader import DataSource

from whotracksme.website.build.home import build_home, build_privacy_policy, build_imprint
from whotracksme.website.build.blog import (
    build_blogpost_list,
    build_blogpost_pages,
    build_rss_feeds,
    load_blog_posts
)
from whotracksme.website.build.websites import (
    build_website_list,
    build_website_pages_batch,
)
from whotracksme.website.build.trackers import (
    build_trackers_list,
    tracker_page_data,
    tracker_page,
    build_tracker_page_batch
)
from whotracksme.website.templates import (
    create_site_structure,
    copy_custom_error_pages,
    generate_sitemap,
)
# from whotracksme.website.build.companies import build_company_pages
from whotracksme.website.build.companies import build_company_reach_chart_page
from whotracksme.website.build.data import (
    build_tracker_db, 
    build_tracker_api_batch, 
    build_website_api_batch
)
from whotracksme.website.build.explorer import build_explorer

from whotracksme.website.utils import print_progress

from whotracksme.website.api.meta import update_api_meta_data


DATA_DIRECTORY = "data"
STATIC_PATH = "static"


DATA_FOLDER = 1 << 0
STATIC_FOLDER = 1 << 1
TEMPLATES_FOLDER = 1 << 2
BLOG_FOLDER = 1 << 3
ALL = (
    DATA_FOLDER |
    STATIC_FOLDER |
    TEMPLATES_FOLDER |
    BLOG_FOLDER
)

class BlockingSingleThreadExecutor(concurrent.futures._base.Executor):
    """
    Helper class to help with debugging.

    It prevents starting multiple processes, but it is only intended for local development (where DEBUG=1).
    All submitted tasks will be immediately executed, and there are no asynchronous operations.
    """

    def submit(self, fn, *args, **kwargs):
        result = fn(*args, **kwargs)
        with concurrent.futures.ThreadPoolExecutor(max_workers=1) as executor:
            return executor.submit(lambda: result)

    def shutdown(self, wait=True, *, cancel_futures=False):
        # nothing to do; all tasks can been already executed
        pass

class Builder:
    def __init__(self):
        self.data_source = None
        self.blog_posts = None

    def build(self):
        self.feed_event(ALL)

    def on_explorer_folder_change(self):
        self.feed_event(EXPLORER_FOLDER)

    def on_data_folder_change(self):
        self.feed_event(DATA_FOLDER)

    def on_templates_folder_change(self):
        self.feed_event(TEMPLATES_FOLDER)

    def on_static_folder_change(self):
        self.feed_event(STATIC_FOLDER)

    def on_blog_folder_change(self):
        self.feed_event(BLOG_FOLDER)

    def _create_executor(self):
        if os.environ.get('DEBUG') == '1':
            print('WARNING: running in debug-mode (no spawning of worker processes)')
            return BlockingSingleThreadExecutor()

        return concurrent.futures.ProcessPoolExecutor(max_workers=8)

    def feed_event(self, event):
        futures = []
        with self._create_executor() as executor:
            ###################################################################
            # This needs to be first, as other tasks will need to write in   #
            # the resulting folders.                                          #
            ###################################################################

            # Depends on folder: 'static/'
            if event & STATIC_FOLDER:
                create_site_structure(static_path=STATIC_PATH)
                print_progress(text='Create _site')


            ###################################################################
            # We then reload data in memory, before generating the site       #
            ###################################################################

            # Depends on folder: 'data/'
            if self.data_source is None or event & DATA_FOLDER:
                # class where all data can be accessed from
                data_source = DataSource()
                print_progress(text='Load data sources')

            # Depends on: 'blog/'
            if self.blog_posts is None or event & BLOG_FOLDER:
                self.blog_posts = load_blog_posts()
                print_progress(text='Load blog posts')


            ###################################################################
            # Once site structure has been created and data is refreshed, we  #
            # can build all parts of the site in parallel, since there is no  #
            # dependencies between them.                                      #
            ###################################################################

            # Depends on: 'templates/', 'data/'
            if event & DATA_FOLDER or event & TEMPLATES_FOLDER:
                print_progress(text='Generate error pages')
                copy_custom_error_pages(data=data_source)

            def batched_job(inp, batch_fn, batch_size, message):
                batches = []
                input_size = len(inp)
                for batch in [inp[i:i + batch_size] for i in range(0, input_size, batch_size)]:
                    submission = executor.submit(batch_fn, batch=batch)
                    batches.append(submission)
                    futures.append(submission)
                for i, f in enumerate(concurrent.futures.as_completed(batches)):
                    print_progress(text=f"{message} {min((i+1) * batch_size, input_size)}/{input_size}")
                return batches

            # Explorer: depends on 'data/'
            if event & DATA_FOLDER or event & STATIC_FOLDER:
                futures.append(executor.submit(
                    build_explorer,
                ))

            # Depends on: 'data/', 'blog/', 'templates/'
            if event & DATA_FOLDER or event & BLOG_FOLDER or event & TEMPLATES_FOLDER:
                futures.append(executor.submit(
                    generate_sitemap,
                    blog_posts=self.blog_posts
                ))


            # Depends on: 'data/', 'templates/'
            if event & DATA_FOLDER or event & TEMPLATES_FOLDER:
                # Home
                build_home(data=data_source)
                build_privacy_policy(data=data_source)
                build_imprint(data=data_source)

                # Trackers
                trackers = [id for id, _ in data_source.trackers.iter()]
                batched_job(trackers, build_tracker_page_batch, 150, "Generate tracker pages")
                build_trackers_list(data=data_source)

                # Websites
                websites = list(enumerate([id for id, _ in data_source.sites.iter()]))
                batched_job(websites, build_website_pages_batch, 400, "Generate website pages")
                build_website_list(data=data_source)

                # Companies
                build_company_reach_chart_page(data=data_source)

            # Depends on: 'data/', 'blog/', 'templates/'
            if event & DATA_FOLDER or event & BLOG_FOLDER or event & TEMPLATES_FOLDER:
                futures.append(executor.submit(
                    build_blogpost_pages,
                    blog_posts=self.blog_posts
                ))

                futures.append(executor.submit(
                    build_rss_feeds,
                    blog_posts=self.blog_posts
                ))

                build_blogpost_list(
                    data=data_source,
                    blog_posts=self.blog_posts
                )

            if event & DATA_FOLDER:
                build_tracker_db()
                trackers = [id for id, _ in data_source.trackers.iter()]
                data_dir = Path('_site/data/trackers/global')
                if not data_dir.exists():
                    data_dir.mkdir(parents=True)
                batched_job(trackers, build_tracker_api_batch, 150, "Generate Tracker API pages")

                site_data_dir = Path('_site/data/sites/global')
                if not site_data_dir.exists():
                    site_data_dir.mkdir(parents=True)

                sites = [id for id, _ in data_source.sites.iter()]
                batched_job(sites, build_website_api_batch, 400, "Generate Website API pages")

            # TODO: uncomment when company profiles are ready
            # if args['site'] or args['companies']:
            #     company_process = Process(target=build_company_pages, args=(data_source,))
            #     company_process.start()

            # Wait for all jobs to finish
            concurrent.futures.wait(futures)

            # Getting the `result` of each promise (although none is expected)
            # allows to re-raise exception happening in children processes. If
            # we don't do it, exceptions will be silently ignored.
            for future in futures:
                future.result()

            update_api_meta_data()
            print('Done')
