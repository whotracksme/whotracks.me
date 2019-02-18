#! /usr/bin/env python
# -*- coding: utf-8 -*-


import concurrent.futures

from whotracksme.data.loader import DataSource

from whotracksme.website.build.home import build_home, build_privacy_policy
from whotracksme.website.build.blog import (
    build_blogpost_list,
    build_blogpost_pages,
    load_blog_posts
)
from whotracksme.website.build.websites import (
    build_website_list,
    build_website_pages
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
from whotracksme.website.build.data import build_tracker_db, build_api
from whotracksme.website.build.explorer import build_explorer

from whotracksme.website.utils import print_progress

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

    def feed_event(self, event):
        futures = []
        with concurrent.futures.ProcessPoolExecutor(max_workers=8) as executor:
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

            # Depends on: 'data/', 'templates/'
            if event & DATA_FOLDER or event & TEMPLATES_FOLDER:
                # Home
                # build_home(data=data_source)
                # futures.append(executor.submit(build_home, data=data_source))
                # futures.append(executor.submit(build_privacy_policy, data=data_source))

                # Trackers
                # build_trackers_list(data=data_source)
                # for tracker_id, tracker in data_source.trackers.iter():
                #     page_data = tracker_page_data(tracker_id, tracker, data_source)
                #     futures.append(executor.submit(tracker_page, data=page_data))
                # print('Tracker pages queue empty')

                # build_tracker_pages(data=data_source)
                # futures.append(executor.submit(build_trackers_list, data=data_source))
                trackers = [id for id, _ in data_source.trackers.iter()]
                n = 20
                for batch in [trackers[i:i + n] for i in range(0, len(trackers), n)]:
                    futures.append(executor.submit(build_tracker_page_batch, batch=batch))
                    # print(batch)
                # futures.append(executor.submit(build_tracker_pages, data=data_source))

                # Websites
                # futures.append(executor.submit(build_website_list, data=data_source))
                # futures.append(executor.submit(build_website_pages, data=data_source))

                # Companies
                # futures.append(executor.submit(build_company_reach_chart_page, data=data_source))

            # Depends on: 'data/', 'blog/', 'templates/'
            # if event & DATA_FOLDER or event & BLOG_FOLDER or event & TEMPLATES_FOLDER:
            #     futures.append(executor.submit(
            #         build_blogpost_list,
            #         data=data_source,
            #         blog_posts=self.blog_posts
            #     ))

            #     futures.append(executor.submit(
            #         build_blogpost_pages,
            #         data=data_source,
            #         blog_posts=self.blog_posts
            #     ))

            # Depends on: 'data/', 'blog/', 'templates/'
            # if event & DATA_FOLDER or event & BLOG_FOLDER or event & TEMPLATES_FOLDER:
            #     futures.append(executor.submit(
            #         generate_sitemap,
            #         data=data_source,
            #         blog_posts=self.blog_posts
            #     ))

            # if event & DATA_FOLDER:
            #     futures.append(executor.submit(
            #         build_tracker_db
            #     ))
            #     futures.append(executor.submit(
            #         build_api,
            #         data=data_source,
            #     ))

            # # Explorer: depends on 'data/'
            # if event & DATA_FOLDER or event & STATIC_FOLDER:
            #     futures.append(executor.submit(
            #         build_explorer,
            #         data=data_source,
            #     ))

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

            print('Done')
