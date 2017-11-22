#! /usr/bin/env python
# -*- coding: utf-8 -*-


from collections import Counter, defaultdict
from datetime import datetime
from statistics import mean

from jinja2 import Markup

from whotracksme.website.utils import print_progress
from whotracksme.website.templates import (
    get_template,
    render_template,
)
from whotracksme.website.plotting.utils import arrow_style
from whotracksme.website.plotting.colors import SiteCategoryColors
from whotracksme.website.plotting.trackers import ts_trend


def prevalence(app):
    pages_change = abs(round((app['history'][-2]['reach'] - app['history'][-1]['reach'] ) * 100, 1)) if len (app['history']) > 1 else 0.
    pages_change_background_color, pages_change_color, pages_change_class = arrow_style(pages_change)

    domains_change = abs(round((app['history'][-2]['site_reach'] - app['history'][-1]['site_reach'] ) * 100, 1)) if len (app['history']) > 1 else 0.
    domains_change_background_color, domains_change_color, domains_change_class = arrow_style(domains_change)

    return {
        "pages": round(app['history'][-1]['reach'] * 100, 1),
        "pages_change": {
            "value": pages_change,
            "background_color": pages_change_background_color,
            "color": pages_change_color,
            "class": pages_change_class,
        },
        "domains": round(app['history'][-1]['site_reach'] * 100, 1),
        "domains_change": {
            "value": domains_change,
            "background_color": domains_change_background_color,
            "color": domains_change_color,
            "class": domains_change_class
        }
    }


def timeseries(app):
    ts = []
    page_reach = []
    site_reach = []
    for t in app["history"]:
        page_reach.append(t.get("reach"))
        ts.append(t.get("ts"))
        site_reach.append(t.get("site_reach"))

    # Make dates valid
    ts = [datetime.strptime(t, "%Y-%m") for t in ts]
    return ts, page_reach, site_reach


def tracking_methods(app):
    # Reducing values to booleans
    methods = {
        "cookies": False,
        "fingerprinting": False
    }
    if app.get("overview", {}).get("cookies") > 0.2:
        methods["cookies"] = True
    if app.get("overview", {}).get("bad_qs") > 0.1:
        methods["fingerprinting"] = True
    return methods


def presence_by_site_type(app, sites):
    categories = Counter(
        filter(lambda c: len(c) > 0,
               [sites.get(s['site'], {}).get('category', '') for s in app.get("sites")]))
    if categories.items():
        normalized_categories = []
        total = sum(categories.values())
        for (k, v) in categories.items():
            if not k == '':
                normalized_categories.append((k, round(100 * (v / float(total)))))

        return sorted(normalized_categories, key=lambda x: x[1], reverse=True)
    return []


def similar_trackers(app, apps, n=4):
    sorted_trackers = sorted(apps.values(), key=lambda a: a['overview']['reach'], reverse=True)

    top_n = []
    for t in sorted_trackers:
        if len(top_n) > n:
            break
        t_subset = {}

        if t.get('cat') == app.get('cat') and t.get('overview', {}).get('id') != app.get('id'):
            t_subset['id'] = t['overview']['id']

            if 'company_id' in t:
                t_subset['company_id'] = t['company_id']
            top_n.append(t_subset)

    return top_n


def tag_cloud_data(aid, app, data):
    def get_site_frequency(site):
        site = data.sites.get(site, None)
        if site is None:
            return 0.
        for site_app in site['apps']:
            if site_app['app'] == aid:
                return site_app['frequency']

    sites_table = [{
            'site': s['site'],
            'frequency': s['frequency'],
            'url': data.url_for('site', s['site'], path_to_root='..') if data.get_site_name(s['site']) is not None else None,
            'site_freq': get_site_frequency(s['site']),
            'site_cat': SiteCategoryColors.get(data.sites.get(s['site'], {}).get('category', '').strip(), '#000'),
            'category': data.sites.get(s['site'], {}).get('category', '').strip()
        } for s in app.get('sites')]

    n_unlinked = len(list(filter(lambda s: s['url'] is None, sites_table)))
    # decide whether non-topsite sites should be included
    if len(sites_table) - n_unlinked > 30:
        sites_table = list(filter(lambda s: s['url'] is not None, sites_table))

    return sites_table


def sites_per_app_by_category(sites_table):
    sites_by_cat = defaultdict(list)
    for s in sites_table:
        sites_by_cat[s["category"].strip()].append(s)
    return sites_by_cat


def tracker_header_stats(apps):
    cookies = []
    fingerpriting = []
    data = []
    for apid, app in apps.items():
        cookies.append(True if app.get("overview", {}).get("cookies") > 0.2 else False)
        fingerpriting.append(True if app.get("overview", {}).get("bad_qs") > 0.1 else False)
        data.append(app.get("overview", {}).get("content_length", 0))

    return {
        "by_cookies": sum(cookies)/len(cookies),
        "by_fingerprinting": sum(fingerpriting)/len(fingerpriting),
        "data": mean(data)
    }

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
