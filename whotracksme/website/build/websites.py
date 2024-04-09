#! /usr/bin/env python
# -*- coding: utf-8 -*-

from operator import itemgetter

from jinja2 import Markup

from whotracksme.data.loader import DataSource
from whotracksme.website.utils import print_progress, write_json
from whotracksme.website.build.companies import (
    tracker_map_data,
    website_doughnout,
)
from whotracksme.website.templates import (
    get_template,
    render_template,
)
from whotracksme.website.plotting.plots import profile_doughnut
from whotracksme.website.plotting.sankey import sankey_plot
from collections import defaultdict

def build_website_list(data):
    header_numbers = data.sites.summary_stats()
    sorted_websites = data.sites.sort_by(metric='popularity', descending=True)
    sorted_websites_cat = data.sites.sort_by(metric='category', descending=True)

    # Include the number of unique trackers ("unique_activities") in the exported API.
    activities_per_site = defaultdict(set)
    for _, row in data.sites_trackers.iter():
        activities_per_site[row.site].add(row.tracker)
    def add_activities(site_data):
        ext_site_data = site_data._asdict()
        ext_site_data['unique_activities'] = len(activities_per_site[site_data.site])
        return ext_site_data
    ext_sorted_websites = [add_activities(i) for i in sorted_websites]
    ext_sorted_websites_cat = [add_activities(i) for i in sorted_websites_cat]

    write_json('_site/api/v2/websites.json',
        website_list=ext_sorted_websites,
        website_list_cat=ext_sorted_websites_cat,
        header_numbers=header_numbers
    )

    with open('_site/websites.html', 'w') as output:
        output.write(render_template(
            template=get_template(data, "websites.html"),
            website_list=sorted_websites,
            website_list_cat=sorted_websites_cat,
            header_numbers=header_numbers
        ))
    print_progress(text="Generate website list")


def website_page(template, site, rank, data):
    site_id = site.site

    # website url is the most common subdomain
    website_url = f'www.{site_id}'
    profile = {
        "rank": rank,
        "website_url": website_url,
        "name":  site.site,
    }

    methods = {
        'cookies': site.cookies > 0.2,
        'fingerprinting': site.bad_qs > 0.1,
    }

    # tracker presence data
    sankey_data = tracker_map_data(site_id, data)
    d_values, d_labels, d_total = website_doughnout(site_id, data)
    profile_dough = Markup(profile_doughnut(d_values, d_labels, d_total))

    rendered_sankey = Markup(sankey_plot(sankey_data))

    # apps per site data
    tracker_table = list(data.sites.get_tracker_list(site_id))

    write_json('_site/api/v2/websites/{}.json'.format(site.site),
        site={
            'overview': site._asdict()
        },
        profile=profile,
        methods=methods,
        sankey_data=sankey_data,
        doughnout={
            "d_values": d_values,
            "d_labels": d_labels,
            "d_total": d_total,
        },
        tracker_categories=d_labels,
        tracker_list=tracker_table,
    )

    with open('_site/websites/{}.html'.format(site.site), 'w') as output:
        output.write(render_template(
            path_to_root='..',
            template=template,
            site={
                'overview': site._asdict()
            },
            profile=profile,
            methods=methods,
            sankey=rendered_sankey,
            doughnut=profile_dough,
            tracker_categories=d_labels,
            tracker_list=tracker_table,
        ))


def build_website_pages(data):
    template = get_template(data, "website-page.html", path_to_root='..')

    for (rank, site) in enumerate(data.sites.sort_by(metric='popularity', descending=True)):
        website_page(template, site, rank + 1, data)

    print_progress(text="Generate website pages")


def build_website_pages_batch(batch):
    with DataSource(populate=False) as data:
        template = get_template(data, "website-page.html", path_to_root='..')

        for rank, site in batch:
            website_page(template,
                        data.sites.get_datapoint(site),
                        rank + 1,
                        data)
