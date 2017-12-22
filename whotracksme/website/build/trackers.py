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


# TODO: add to Tracker class
def prevalence(app):
    pages_change = abs(round((app['history'][-2]['reach'] - app['history'][-1]['reach']) * 100, 1)) if len(app['history']) > 1 else 0.
    pages_change_background_color, pages_change_color, pages_change_class = arrow_style(pages_change)

    domains_change = abs(round((app['history'][-2]['site_reach'] - app['history'][-1]['site_reach']) * 100, 1)) if len(app['history']) > 1 else 0.
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


# TODO: Add relevant parts to Tracker class
def tag_cloud_data(aid, app, data):
    def get_site_frequency(site_id):
        site = data.sites.get_site(site_id)

        # checking if site where tracker is seen is among top sites
        # and assigning a frequency of 0 if not
        if not site:
            return 0.
        for tracker in site['apps']:
            if tracker['app'] == aid:
                return tracker['frequency']

    all_sites = [{
            'site': s['site'],
            'frequency': s['frequency'],
            'url': data.url_for('site', s['site'], path_to_root='..') if data.sites.get_name(s['site']) is not None else None,
            'site_freq': get_site_frequency(s['site']),
            'site_cat': SiteCategoryColors.get(data.sites.get_site(s['site']).get('category', '').strip(), '#000'),
            'category': data.sites.get_site(s['site']).get('category', '').strip()
        } for s in data.apps.iter_sites(aid)]

    n_unlinked = len(list(filter(lambda s: s['url'] is None, all_sites)))
    # decide whether non-topsite sites should be included
    if len(all_sites) - n_unlinked > 30:
        all_sites = list(filter(lambda s: s['url'] is not None, all_sites))


    sites_by_category = defaultdict(list)
    for s in all_sites:
        sites_by_category[s['category']].append(s)

    return all_sites, sites_by_category


def build_trackers_list(data):
    # TODO: Should no longer be needed, happens when data is loaded
    # for tracker in sorted_trackers:
    #     if 'name' not in tracker:
    #         tracker['name'] = tracker['overview']['id']

    with open('_site/trackers.html', 'w') as output:
        output.write(render_template(
            template=get_template(data, name="trackers.html"),
            tracker_list=data.apps.sort_by_prevalence(),
            # TODO: Rename to trackers_list_comp
            trackers_list_cat=data.apps.sort_by_company(),
            header_stats=data.apps.summary_stats()
        ))

    print_progress(text="Generate tracker list")


def tracker_page(template, aid, app, data):
    # NOTE: Should no longer be needed - part of DataSource
    # if 'name' not in app:
    #     app['name'] = aid

    # Tracker Reach ts
    reach = data.apps.get_reach(aid)

    # page_reach trend line
    page_trend = Markup(ts_trend(ts=reach.get('page'), t=reach.get('ts')))

    # domain_reach trend line
    site_trend = Markup(ts_trend(ts=reach.get('site'), t=reach.get('ts')))

    # tag cloud data
    all_sites, sites_by_cat = tag_cloud_data(aid, app, data)

    # for horizontal bar chart in profile
    website_types = data.apps.get_presence_by_site_category(aid, data.sites)

    with open('_site/{}'.format(data.url_for('app', aid)), 'w') as output:
        output.write(render_template(
            path_to_root='..',
            template=template,
            app=app,
            profile=app,  # profile-card hack
            prevalence=prevalence(app),
            tracking_methods=data.apps.get_tracking_methods(aid),
            website_list=all_sites,
            sites_by_cat=sites_by_cat,
            website_types=website_types[:5], # top 5
            similar_trackers=data.apps.similar_trackers(aid),
            trends={'page': page_trend, 'site': site_trend},
            trackers=data.apps.summary_stats()['count']
        ))


def build_tracker_pages(data):
    template = get_template(data, name='tracker-page.html', path_to_root='..')

    for (aid, app) in data.apps.iter():
        tracker_page(template, aid, app, data)

    print_progress(text="Generate tracker pages")
