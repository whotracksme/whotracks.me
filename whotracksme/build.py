#! /usr/bin/env python
# -*- coding: utf-8 -*-

"""
Module to build Tracking the Trackers site

Usage:
    build [--serve]
    build -h | --help

Options:
    --serve         Watch for changes and reload.
    -h, --help      Show help message.
"""

from datetime import datetime
from multiprocessing import Process, Queue
import atexit
import concurrent.futures
import http.server
import json
import os
import pkgutil
import signal
import socketserver
import sys
import time


from docopt import docopt
from watchdog.observers import Observer
import watchdog

from whotracksme.utils.trackers import (
    prevalence,
    timeseries,
    tracking_methods,
    presence_by_site_type,
    similar_trackers,
    tag_cloud_data,
    sites_per_app_by_category,
    tracker_header_stats
)
from whotracksme.utils.blog import parse as parse_blogpost
from whotracksme.utils.websites import (
    changes,
    header_stats,
    sort_by_cat,
    sort_by_rank,
    summary_stats,
    tracked_by_category
)

from whotracksme.utils.companies import (
    companies_present,
    company_reach,
    get_company_name,
    website_doughnout
)

from whotracksme.utils.site_index import site_to_json

from whotracksme.templating import (
    DataSource,
    Markup,
    create_site_structure,
    get_template,
    render_template
)

from whotracksme.plotting.plots import profile_doughnut
from whotracksme.plotting.sankey import alluvial_plot
from whotracksme.plotting.companies import overview_bars
from whotracksme.plotting.trackers import ts_trend


DATA_DIRECTORY = "data"
STATIC_PATH = "static"


def load_json_file(name):
    return json.loads(pkgutil.get_data('whotracksme', f'data/{name}.json'))


def print_progress(text, default_space=40):
    print("{} {:{}} done".format(text, "." * (default_space - len(text)), default_space - len(text)))


# ---------------------     Main Page   ----------------------------

def build_home(data):
    apps = data.apps

    sorted_trackers = sorted(apps.values(), key=lambda a: a['overview']['reach'], reverse=True)
    sorted_trackers_cat = sorted(apps.values(), key=lambda a: a.get('cat', '') or '')

    for tracker in sorted_trackers:
        if 'name' not in tracker:
            tracker['name'] = tracker['overview']['id']

    for tracker in sorted_trackers_cat:
        if 'name' not in tracker:
            tracker['name'] = tracker['overview']['id']

    # most tracked sites by cat
    most_tracked_sites = tracked_by_category(data.sites, worst=True)
    # least tracked sites by cat
    least_tracked_sites = tracked_by_category(data.sites, worst=False)

    top10 = company_reach(data.companies)
    header_graph = Markup(overview_bars(top10))

    with open('_site/index.html', 'w') as output:
        output.write(render_template(
            template=get_template(data, "index.html"),
            ts=header_graph,
            tracker_list=sorted_trackers[:20],
            trackers_list_cat=sorted_trackers_cat[:20],
            most_tracked_sites=most_tracked_sites,
            least_tracked_sites=least_tracked_sites
        ))

    print_progress(text="Generate home page")


# ---------------------     Trackers   ----------------------------
def build_trackers_list(data):
    apps = data.apps

    sorted_trackers = sorted(apps.values(), key=lambda a: a['overview']['reach'], reverse=True)
    sorted_trackers_cat = sorted(
        apps.values(),
        key=lambda a: data.get_app_name(
            a['overview']['id']) if (
                'company_id' not in a or
                a['company_id'] in [None, "None"])
            else a['company_id']
    )

    for tracker in sorted_trackers:
        if 'name' not in tracker:
            tracker['name'] = tracker['overview']['id']

    with open('_site/trackers.html', 'w') as output:
        output.write(render_template(
            template=get_template(data, name="trackers.html"),
            tracker_list=sorted_trackers,
            trackers_list_cat=sorted_trackers_cat,
            header_stats=tracker_header_stats(data.apps)
        ))

    print_progress(text="Generate tracker list")


def tracker_page(template, aid, app, data):
    if 'name' not in app:
        app['name'] = aid

    # Tracker Reach ts
    ts, page_reach, site_reach = timeseries(app)

    # page_reach trend line
    page_trend = Markup(ts_trend(ts=page_reach, t=ts))

    # domain_reach trend line
    site_trend = Markup(ts_trend(ts=site_reach, t=ts))

    methods = tracking_methods(app)

    # tag cloud data
    sites_table = tag_cloud_data(aid, app, data)
    sites_by_cat = sites_per_app_by_category(sites_table)

    # for horizontal bar chart in profile
    website_types = presence_by_site_type(app, data.sites)

    # similar trackers
    similar_tracker_list = similar_trackers(app, data.apps, n=4)

    # write to file
    with open('_site/{}'.format(data.url_for('app', aid)), 'w') as output:
        output.write(render_template(
            path_to_root='..',
            template=template,
            app=app,
            profile=app,  # profile-card hack
            prevalence=prevalence(app),
            tracking_methods=methods,
            website_list=sites_table,
            sites_by_cat=sites_by_cat,
            website_types=website_types[:5], # top 3
            similar_trackers=similar_tracker_list,
            trends={"page": page_trend, "site": site_trend}
        ))


def build_tracker_pages(data):
    apps = data.apps
    template = get_template(data, name='tracker-page.html', path_to_root='..')

    for (aid, app) in apps.items():
        tracker_page(template, aid, app, data)

    print_progress(text="Generate tracker pages")


# ---------------------     Blog   ----------------------------
def build_blogpost_list(data, blog_posts):
    with open('_site/blog.html', 'w') as output:
        output.write(render_template(
            template=get_template(data, "blog.html"),
            blog_posts=[p for p in blog_posts if p['publish']]
        ))
    print_progress(text="Generate blog list")


def build_blogpost_pages(data, blog_posts):
    template = get_template(
        data,
        "blog-page.html",
        render_markdown=True,
        path_to_root='..'
    )

    for blog_post in blog_posts:
        with open("_site/blog/{}.html".format(blog_post.get("filename")), 'w') as output:
            output.write(
                render_template(
                    path_to_root='..',
                    template=template,
                    blog_post=blog_post
                )
            )

    print_progress(text="Generate blog posts")


# ---------------------     Websites   ----------------------------
def build_website_list(data):
    sites = data.sites
    tracker_requests, tracker_buckets, https = summary_stats(data.sites)

    # header stats
    tracker_values = []
    tracker_labels = []
    for (k, v) in tracker_buckets.items():
        tracker_values.append(v)
        tracker_labels.append(k)

    header_numbers = header_stats(data.sites)

    sorted_websites = sort_by_rank(data.sites)
    sorted_websites_cat = sort_by_cat(data.sites)

    # write to file
    with open('_site/websites.html', 'w') as output:
        output.write(render_template(
            template=get_template(data, "websites.html"),
            website_list=sorted_websites,
            website_list_cat=sorted_websites_cat,
            header_numbers=header_numbers
        ))
    print_progress(text="Generate website list")


def website_page(template, site_id, rank, data):
    companies = data.companies
    apps = data.apps
    site = data.sites.get(site_id)
    profile = {
        "rank": rank,
        "website_url": site["overview"]["site"],
        "name":  site["overview"]["site"],
        "overview": site["overview"]
    }

    methods = tracking_methods(site)
    tracker_changes = changes(site)

    # tracker presence data
    sankey_data = companies_present(companies, apps, site=site)
    d_values, d_labels, d_total = website_doughnout(apps, site)
    profile_dough = Markup(profile_doughnut(d_values, d_labels, d_total))

    real_sankey = Markup(alluvial_plot(sankey_data))

    # apps per site data
    apps_table = []
    for a in site.get("apps"):
        f = a.get("frequency")
        apid = a.get("app")
        if apps.get(apid):
            appdict = apps.get(apid)
            appdict["frequency"] = f
            apps_table.append(appdict)

    sorted_trackers = sorted(apps_table, key=lambda a: a['frequency'], reverse=True)
    sorted_trackers_cat = sorted(apps_table, key=lambda a: a.get("company_id", "") if a.get("company_id") is not None else "")

    # write to file
    with open('_site/websites/{}.html'.format(site["name"]), 'w') as output:
        output.write(render_template(
            path_to_root='..',
            template=template,
            site=site,
            profile=profile,
            methods=methods,
            tracker_changes=tracker_changes,
            sankey=real_sankey,
            doughnut=profile_dough,
            tracker_categories=d_labels,
            tracker_list=sorted_trackers,
            trackers_list_cat=sorted_trackers_cat
        ))


def build_website_pages(data):
    sites = data.sites
    template = get_template(data, "website-page.html", path_to_root='..')

    for rank, (site_id, site) in enumerate(sorted(sites.items(), key=lambda s: s[1]['overview']['popularity'], reverse=True)):
        website_page(template, site_id, rank + 1, data)

    print_progress(text="Generate website pages")


# ---------------------   Companies   ----------------------------
def company_page(template, company_data, data):
    company_data["logo"] = None
    company_id = company_data['overview']['id']

    company_name = get_company_name(company_data)
    with open('_site/{}'.format(data.url_for('company', company_id)), 'w') as output:
        output.write(render_template(
            path_to_root='..',
            template=template,
            demographics=company_data,
            initials=company_name[:2]
        ))


def build_company_pages(data):
    companies = data.companies
    template = get_template(data, "company-page.html")

    for company_data in companies.values():
        company_page(template, company_data, data)

    print_progress(text="Generate company pages")


def copy_custom_error_pages(data):
    error_pages = {
        "not-found": get_template(data, "not-found.html"),
        "tracker-not-found": get_template(data, "tracker-not-found.html"),
        "website-not-found": get_template(data, "website-not-found.html")
    }

    for error, template in error_pages.items():
        with open('_site/{}.html'.format(error), 'w') as output:
            output.write(render_template(template=template))


def generate_sitemap(data, blog_posts):
    # write sitemap to _site (to be used as index for static site search)
    with open("_site/sitemap.json", "w") as output:
        json.dump(
            site_to_json(
                data_source=data,
                blog_posts=blog_posts),
            output
        )
    print_progress(text='Generate sitemap index')


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


def handle_exit(*args):
    sys.exit(0)


def build(queue):
    data_source = None
    blog_posts = None

    # Exit cleanly on CTRL-C
    signal.signal(signal.SIGINT, handle_exit)

    with concurrent.futures.ProcessPoolExecutor() as executor:
        while True:
            futures = []

            # Wait for next event
            event = queue.get()

            # This means the build process should stop
            if event is None:
                return

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
            if data_source is None or event & DATA_FOLDER:
                # class where all data can be accessed from
                data_source = DataSource(
                    load_json_file('overview'),
                    load_json_file('apps'),
                    load_json_file('companies'),
                    load_json_file('sites')
                )
                print_progress(text='Load data sources')

            # Depends on: 'blog/'
            if blog_posts is None or event & BLOG_FOLDER:
                blog_posts = [
                    parse_blogpost(os.path.join("blog", f))
                    for f in os.listdir("blog/")
                ]
                blog_posts.sort(
                    key=lambda p: datetime.strptime(p['date'], '%Y-%m-%d'),
                    reverse=True
                )
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
                    blog_posts=blog_posts
                ))

                futures.append(executor.submit(
                    build_blogpost_pages,
                    data=data_source,
                    blog_posts=blog_posts
                ))

            # Depends on: 'data/', 'blog/'
            if event & DATA_FOLDER or event & BLOG_FOLDER:
                futures.append(executor.submit(
                    generate_sitemap,
                    data=data_source,
                    blog_posts=blog_posts
                ))

            # TODO: uncomment when company profiles are ready
            # if args['site'] or args['companies']:
            #     company_process = Process(target=build_company_pages, args=(data_source,))
            #     company_process.start()

            concurrent.futures.wait(futures)
            print('Done')


def watch(queue):
    """Watch changes in directories and yield events indicating where the change
    happened: BLOG_FOLDER, STATIC_FOLDER, TEMPLATES_FOLDER, DATA_FOLDER. The
    events are then consumed by `build` which will rebuild only what is needed
    after each change.
    """
    watched_directories = {
        'blog': BLOG_FOLDER,
        'data': DATA_FOLDER,
        'static': STATIC_FOLDER,
        'templates': TEMPLATES_FOLDER
    }

    def handle_event(event):
        path = event.src_path
        directory = os.path.relpath(os.path.dirname(path))
        if directory in watched_directories:
            print('>', path, 'changed')
            queue.put(watched_directories[directory])

    class Callback(watchdog.events.FileSystemEventHandler):
        def on_created(self, event):
            handle_event(event)
        def on_deleted(self, event):
            handle_event(event)
        def on_modified(self, event):
            handle_event(event)
        def on_moved(self, event):
            handle_event(event)

    observer = Observer()
    observer.schedule(Callback(), '.', recursive=True)
    observer.start()

    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()


def serve(cwd, port):
    """Serve site locally."""
    # Exit cleanly on CTRL-C
    signal.signal(signal.SIGINT, handle_exit)

    if not os.path.exists('_site'):
        os.mkdir('_site')

    os.chdir(cwd)
    handler = http.server.SimpleHTTPRequestHandler

    try:
        with socketserver.TCPServer(("", port), handler) as httpd:
            httpd.serve_forever()
    except OSError as e:
        print(e)
        handle_exit()


def main():
    args = docopt(__doc__)

    # Create pipe to communicate with builder process
    queue = Queue()

    # Start builder process
    build_process = Process(target=build, args=(queue,))
    build_process.start()

    # Initial build
    queue.put(ALL)

    if args['--serve']:
        # Start serving the website locally
        port = 8000
        print("Serving _site locally: http://localhost:{}".format(port))
        serve_process = Process(target=serve, args=('_site/', port), daemon=True)
        serve_process.start()

        # Register a callback to handle termination properly
        def cleanup():
            print('Terminate child processes...')
            serve_process.terminate()
            build_process.terminate()
            print('Exiting')

        atexit.register(cleanup)

        # Start watching for changes
        watch(queue)
    else:
        # Signal build process to stop
        queue.put(None)


if __name__ == '__main__':
    main()
