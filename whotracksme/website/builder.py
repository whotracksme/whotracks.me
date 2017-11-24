#! /usr/bin/env python
# -*- coding: utf-8 -*-


import concurrent.futures
import json
import pkgutil

from whotracksme.data.loader import DataSource

from whotracksme.website.build.home import build_home
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
    build_tracker_pages,
)

from whotracksme.website.templates import (
    create_site_structure,
    copy_custom_error_pages,
    generate_sitemap,
)
# from whotracksme.website.build.companies import build_company_pages

from whotracksme.website.utils import print_progress

DATA_DIRECTORY = "data"
STATIC_PATH = "static"


DATA_FOLDER = 0x00000001
STATIC_FOLDER = 0x00000002
TEMPLATES_FOLDER = 0x00000004
BLOG_FOLDER = 0x00000008
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
        with concurrent.futures.ThreadPoolExecutor() as executor:
            ###################################################################
            # Thist needs to be first, as other tasks will need to write in   #
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

            # Depends on: 'data/'
            if event & DATA_FOLDER:
                # Home
                futures.append(executor.submit(build_home, data=data_source))

                # Trackers
                futures.append(executor.submit(build_trackers_list, data=data_source))
                futures.append(executor.submit(build_tracker_pages, data=data_source))

                # Websites
                futures.append(executor.submit(build_website_list, data=data_source))
                futures.append(executor.submit(build_website_pages, data=data_source))

            # Depends on: 'data/', 'blog/', 'templates/'
            if event & DATA_FOLDER or event & BLOG_FOLDER or event & TEMPLATES_FOLDER:
                futures.append(executor.submit(
                    build_blogpost_list,
                    data=data_source,
                    blog_posts=self.blog_posts
                ))

                futures.append(executor.submit(
                    build_blogpost_pages,
                    data=data_source,
                    blog_posts=self.blog_posts
                ))

            # Depends on: 'data/', 'blog/'
            if event & DATA_FOLDER or event & BLOG_FOLDER:
                futures.append(executor.submit(
                    generate_sitemap,
                    data=data_source,
                    blog_posts=self.blog_posts
                ))

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
