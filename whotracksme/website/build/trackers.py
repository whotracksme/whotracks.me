from collections import defaultdict

from jinja2 import Markup

from whotracksme.website.utils import print_progress
from whotracksme.website.templates import (
    get_template,
    render_template,
)
from whotracksme.website.plotting.colors import site_category_colors
from whotracksme.website.plotting.trackers import ts_trend


def recent_tracker_reach(reach):
    return {
        "pages": round(reach['page'][-1]*100, 1),
        "sites": round(reach['site'][-1]*100, 1)
    }

def tag_cloud_data(tracker_id, data):
    all_sites = [{
        'site': s.site,
        'frequency': s.tracker_proportion,
        'url': data.url_for('site', s.site, path_to_root='..')
            if s.site in data.sites.site_category else None,
        'site_freq': s.site_proportion,
        'site_cat': site_category_colors.get(
            data.sites.site_category.get(s.site, None), '#000'
        ),
        'category': data.sites.site_category.get(s.site, '')
    } for s in data.trackers.iter_sites(tracker_id)]

    n_unlinked = len(list(filter(lambda s: s['url'] is None, all_sites)))

    # decide whether non-topsite sites should be included
    if len(all_sites) - n_unlinked > 30:
        all_sites = list(filter(lambda s: s['url'] is not None, all_sites))

    sites_by_category = defaultdict(list)
    for s in all_sites:
        sites_by_category[s['category']].append(s)

    return all_sites, sites_by_category


def build_trackers_list(data):
    with open('_site/trackers.html', 'w') as output:
        output.write(render_template(
            template=get_template(data, name="trackers.html"),
            tracker_list=data.trackers.sort_by(metric="reach"),
            trackers_list_company=data.trackers.sort_by(
                metric="company_id",
                descending=False
            ),
            header_stats=data.trackers.summary_stats()
        ))

    print_progress(text="Generate tracker list")


def tracker_page(template, tracker_id, tracker, data):
    # Tracker Reach ts
    reach = data.trackers.get_reach(tracker_id)

    # page_reach trend line
    page_trend = Markup(ts_trend(ts=reach.get('page'), t=reach.get('ts')))

    # domain_reach trend line
    site_trend = Markup(ts_trend(ts=reach.get('site'), t=reach.get('ts')))

    # tag cloud data
    all_sites, sites_by_cat = tag_cloud_data(tracker_id, data)

    # for horizontal bar chart in profile
    website_types = data.trackers.get_presence_by_site_category(tracker_id, data.sites)

    with open(f'_site/{data.url_for("tracker", tracker_id)}', 'w') as output:
        output.write(render_template(
            path_to_root='..',
            template=template,
            app=tracker,
            profile=data.trackers.get_tracker(tracker_id),  # profile-card hack
            reach=recent_tracker_reach(reach),
            tracking_methods=data.trackers.get_tracking_methods(tracker_id),
            website_list=all_sites,
            sites_by_cat=sites_by_cat,
            website_types=website_types[:5],  # top 5
            similar_trackers=data.trackers.similar_trackers(tracker_id),
            trends={'page': page_trend, 'site': site_trend},
            trackers=data.trackers.summary_stats()['count']
        ))


def build_tracker_pages(data):
    template = get_template(data, name='tracker-page.html', path_to_root='..')

    for (tracker_id, tracker) in data.trackers.iter():
        tracker_page(template, tracker_id, tracker, data)

    print_progress(text="Generate tracker pages")
