#! /usr/bin/env python
# -*- coding: utf-8 -*-

from operator import itemgetter

from jinja2 import Markup

from whotracksme.website.utils import print_progress
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


def build_website_list(data):
    header_numbers = data.sites.summary_stats()

    sorted_websites = data.sites.sort_by(metric='popularity', descending=True)
    sorted_websites_cat = data.sites.sort_by(metric='category', descending=True)

    with open('_site/websites.html', 'w') as output:
        output.write(render_template(
            template=get_template(data, "websites.html"),
            website_list=sorted_websites,
            website_list_cat=sorted_websites_cat,
            header_numbers=header_numbers
        ))
    print_progress(text="Generate website list")


def website_page(template, site, rank, data):
    site_id = site['overview']['site']

    # website url is the most common subdomain
    website_url = sorted(
        site.get('subdomains').items(),
        key=itemgetter(1),
        reverse=True)[0][0]
    profile = {
        "rank": rank,
        "website_url": website_url,
        "name":  site["overview"]["site"],
        "overview": site["overview"]
    }

    methods = data.sites.tracking_methods(site_id)

    # tracker presence data
    sankey_data = tracker_map_data(site_id, data)
    d_values, d_labels, d_total = website_doughnout(data.trackers, site)
    profile_dough = Markup(profile_doughnut(d_values, d_labels, d_total))

    rendered_sankey = Markup(sankey_plot(sankey_data))

    # apps per site data
    tracker_table = []
    for a in site.get("apps"):
        freq = a.get("frequency")
        tracker_id = a.get("app")
        if data.trackers.get_tracker(tracker_id):
            tracker = data.trackers.get_tracker(tracker_id)
            tracker["frequency"] = freq
            tracker_table.append(tracker)

    sorted_trackers = sorted(
        tracker_table,
        key=lambda a: a['frequency'],
        reverse=True
    )
    sorted_trackers_cat = sorted(
        tracker_table,
        key=lambda a: a.get("company_id", "")
        if a.get("company_id") is not None else ""
    )

    with open('_site/websites/{}.html'.format(site["name"]), 'w') as output:
        output.write(render_template(
            path_to_root='..',
            template=template,
            site=site,
            profile=profile,
            methods=methods,
            sankey=rendered_sankey,
            doughnut=profile_dough,
            tracker_categories=d_labels,
            tracker_list=sorted_trackers,
            trackers_list_cat=sorted_trackers_cat
        ))


def build_website_pages(data):
    template = get_template(data, "website-page.html", path_to_root='..')

    for (rank, site) in enumerate(data.sites.sort_by(metric='popularity', descending=True)):
        website_page(template, site, rank + 1, data)

    print_progress(text="Generate website pages")
