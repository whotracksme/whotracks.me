#! /usr/bin/env python
# -*- coding: utf-8 -*-
"""
Module to build Tracking the Trackers site

Usage:
    build ( site | home | trackers | websites |  companies | blog )
    build -h | --help

Options:
    -h, --help                   Show help message.
"""

from docopt import docopt
from utils.trackers import (
    prevalence,
    timeseries,
    tracking_methods,
    presence_by_site_type,
    similar_trackers,
    tag_cloud_data,
    sites_per_app_by_category,
    tracker_header_stats
)
from utils.blog import parse as parse_blogpost
from utils.websites import summary_stats, changes, sort_by_rank, sort_by_cat, tracked_by_category, header_stats
from utils.companies import companies_present, get_company_name, website_doughnout, company_reach
from utils.site_index import site_to_json

from templating import create_site_structure, get_template, render_template, Markup, DataSource

from plotting.plots import profile_doughnut
from plotting.sankey import alluvial_plot
from plotting.companies import overview_bars
from plotting.trackers import ts_trend

import os
import subprocess
import json
from datetime import datetime
from multiprocessing import Process
import concurrent.futures


def load_json_file(directory, name):
    with open(directory + '/' + name + '.json') as fp:
        return json.load(fp)


def print_progress(text, default_space=40):
    print("{} {:{}} done".format(text, "." * (default_space - len(text)), default_space - len(text)))


# ---------------------     Main Page   ----------------------------

def build_home(data):
    apps = data.apps

    sorted_trackers = sorted(apps.values(), key=lambda a: a['overview']['reach'], reverse=True)
    sorted_trackers_cat = sorted(apps.values(), key=lambda a: '' if 'cat' not in a or 'cat' in a and a['cat'] is None else  a['cat'])

    for t in sorted_trackers:
        if 'name' not in t:
            t['name'] = t['overview']['id']

    for t in sorted_trackers_cat:
        if 'name' not in t:
            t['name'] = t['overview']['id']

    # most tracked sites by cat
    most_tracked_sites = tracked_by_category(data.sites, worst=True)
    # least tracked sites by cat
    least_tracked_sites = tracked_by_category(data.sites, worst=False)

    top10 = company_reach(data.companies)
    header_graph = Markup(overview_bars(top10))

    with open('_site/index.html', 'w') as fp:
        content = render_template(
            template=get_template(data, "index.html"),
            ts=header_graph,
            tracker_list=sorted_trackers[:20],
            trackers_list_cat=sorted_trackers_cat[:20],
            most_tracked_sites=most_tracked_sites,
            least_tracked_sites=least_tracked_sites
        )
        fp.write(content)
        print_progress(text="Home page")
        return


# ---------------------     Trackers   ----------------------------
def build_trackers_list(data):
    apps = data.apps

    sorted_trackers = sorted(apps.values(), key=lambda a: a['overview']['reach'], reverse=True)
    sorted_trackers_cat = sorted(apps.values(), key=lambda a: data.get_app_name(a['overview']['id']) if 'company_id' not in a or 'company_id' in a and a['company_id'] in [None, "None"] else  a['company_id'])

    for t in sorted_trackers:
        if 'name' not in t:
            t['name'] = t['overview']['id']
    with open('_site/trackers.html', 'w') as fp:
        file_content = render_template(
            template=get_template(data, name="trackers.html"),
            tracker_list=sorted_trackers,
            trackers_list_cat=sorted_trackers_cat,
            header_stats=tracker_header_stats(data.apps)
        )

        fp.write(file_content)
        print_progress(text="Tracker list")
        return


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
    with open('_site/{}'.format(data.url_for('app', aid)), 'w') as fp:
        content = render_template(
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
        )
        fp.write(content)
        return


def build_tracker_pages(data):
    apps = data.apps
    template = get_template(data, name='tracker-page.html', path_to_root='..')

    # NOTE: trying to make faster
    with concurrent.futures.ThreadPoolExecutor(max_workers=100) as executor:
        futures = {executor.submit(tracker_page, template, aid, app, data): (aid, app)
            for (aid, app) in list(sorted(apps.items(), key=lambda a: a[1]['overview']['reach'], reverse=True))}
        for future in futures:
            future.result()

    print_progress(text="Tracker Pages")


# ---------------------     Blog   ----------------------------
def build_blogpost_list(data):
    with open('_site/blog.html', 'w') as fp:
        blog_posts = [parse_blogpost(os.path.join("{}".format("blog"), f)) for f in os.listdir("blog/")]
        blog_posts = reversed(sorted(
            [p for p in blog_posts if p['publish']], 
            key=lambda p: datetime.strptime(p['date'], '%Y-%m-%d')
        ))

        content = render_template(
            template=get_template(data, "blog.html"),
            blog_posts=blog_posts
        )
        fp.write(content)
        print_progress(text="Blog List")
        return


def build_blogpost_pages(data):
    template = get_template(data, "blog-page.html", render_markdown=True, path_to_root='..')
    for f in os.listdir("blog/"):
        blog_post = parse_blogpost(os.path.join("blog", f))
        with open("_site/blog/{}.html".format(blog_post.get("filename")), 'w') as fp:
            fp.write(
                render_template(
                    path_to_root='..',
                    template=template,
                    blog_post=blog_post
                )
            )
    print_progress(text="Blog Posts")


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
    with open('_site/websites.html', 'w') as fp:
        file_content = render_template(
            template=get_template(data, "websites.html"),
            website_list=sorted_websites,
            website_list_cat=sorted_websites_cat,
            header_numbers=header_numbers
        )
        fp.write(file_content)
        print_progress(text="Website list")
        return


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
    sorted_trackers_cat = sorted(list(apps_table), key=lambda a: a.get("company_id", "") if a.get("company_id") is not None else "")

    # write to file
    with open('_site/websites/{}.html'.format(site["name"]), 'w') as fp:
        content = render_template(
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
        )
        fp.write(content)
        return


def build_website_pages(data):
    sites = data.sites
    template = get_template(data, "website-page.html", path_to_root='..')

    # NOTE: trying to make faster
    with concurrent.futures.ThreadPoolExecutor(max_workers=100) as executor:
        futures = {executor.submit(website_page, template, site_id, rank + 1, data): (site_id, site)
                   for rank, (site_id, site) in enumerate(sorted(sites.items(),
                                                                 key=lambda s: s[1]['overview']['popularity'],
                                                                 reverse=True))}
        for future in futures:
            future.result()

    print_progress(text="Website pages")


# ---------------------   Companies   ----------------------------
def company_page(template, company_data, data):
        company_data["logo"] = None
        company_id = company_data['overview']['id']

        company_name = get_company_name(company_data)
        with open('_site/{}'.format(data.url_for('company', company_id)), 'w') as fp:
            content = render_template(
                path_to_root='..',
                template=template,
                demographics=company_data,
                initials=company_name[:2]
            )
            fp.write(content)
            return


def build_company_pages(data):
    companies = data.companies
    template = get_template(data, "company-page.html")

    with concurrent.futures.ThreadPoolExecutor(max_workers=100) as executor:
        futures = {executor.submit(company_page, template, company_data, data): company_data for (_, company_data) in companies.items()}
        for future in futures:
            future.result()

    print_progress(text="Company pages")


def copy_custom_error_pages(data):
    error_pages = {
        "not-found": get_template(data, "not-found.html"),
        "tracker-not-found": get_template(data, "tracker-not-found.html"),
        "website-not-found": get_template(data, "website-not-found.html")
    }

    for error, template in error_pages.items():
        with open('_site/{}.html'.format(error), 'w') as fp:
            fp.write(render_template(template=template))
    return


if __name__ == '__main__':
    args = docopt(__doc__)

    # create_site_structure
    create_site_structure(static_path="static")

    # loading data and generating pages for all entities
    data_directory = "data"

    # class where all data can be accessed from
    data_source = DataSource(
        load_json_file(data_directory, 'overview'),
        load_json_file(data_directory, 'apps'),
        load_json_file(data_directory, "companies"),
        load_json_file(data_directory, 'sites')
    )

    # write sitemap to _site (to be used as index for static site search)
    sitemap = site_to_json(data_source=data_source)
    with open("_site/sitemap.json", "w") as fp:
        json.dump(sitemap, fp)

    # error pages
    copy_custom_error_pages(data=data_source)

    if args["site"] or args['home']:
        build_home(data=data_source)

    if args['site'] or args['trackers']:
        build_trackers_list(data=data_source)
        trackers_process = Process(target=build_tracker_pages, args=(data_source,))
        trackers_process.start()

    if args['site'] or args['websites']:
        build_website_list(data_source)
        sites_process = Process(target=build_website_pages, args=(data_source,))
        sites_process.start()

    # TODO: uncomment when company profiles are ready
    # if args['site'] or args['companies']:
    #     company_process = Process(target=build_company_pages, args=(data_source,))
    #     company_process.start()

    if args['site'] or args['blog']:
        build_blogpost_list(data_source)
        build_blogpost_pages(data_source)
