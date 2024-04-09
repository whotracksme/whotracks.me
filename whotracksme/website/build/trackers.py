from collections import defaultdict
from markupsafe import Markup

from whotracksme.data.loader import DataSource
from whotracksme.website.utils import print_progress, write_json, without_keys
from whotracksme.website.templates import (
    get_template,
    render_template,
)
from whotracksme.website.plotting.colors import site_category_colors
from whotracksme.website.plotting.trackers import ts_trend


def recent_tracker_reach(reach):
    def format_reach(r):
        if r >= 0.1:
            return round(r, 1)
        elif 0.01 <= r <= 0.1:
            return round(r, 2)
        return  "<0.01"

    return {
        "pages": format_reach(reach['page'][-1] * 100),
        "sites": reach['site'][-1]
    }



def tag_cloud_data(tracker_id, data):
    cursor = data.db.connection.cursor()
    cursor.execute('''
    SELECT
        sites_trackers_data.site,
        tracker_proportion AS frequency,
        site_proportion AS site_freq,
        sites_data.category AS category,
        sites_data.trackers AS trackers
    FROM sites_trackers_data
    LEFT JOIN sites_data ON sites_trackers_data.site = sites_data.site AND
        sites_trackers_data.month = sites_data.month AND
        sites_trackers_data.country = sites_data.country
    WHERE sites_trackers_data.month = ?
        AND sites_trackers_data.country = ?
        AND sites_trackers_data.tracker = ?
    ORDER BY tracker_proportion DESC
    ''', (data.trackers.last_month, data.trackers.region, tracker_id))

    def site_summary(row):
        site, frequency, site_freq, category, trackers = row
        return {
            'site': site,
            'frequency': frequency,
            'site_freq': site_freq,
            'category': category or '',
            'url': data.url_for('site', site, path_to_root='..') if category is not None else None,
            'site_cat': site_category_colors.get(category, '#000'),
            'trackers': trackers,
        }

    all_sites = list(map(site_summary, cursor.fetchall()))

    n_unlinked = len(list(filter(lambda s: s['url'] is None, all_sites)))

    # decide whether non-topsite sites should be included
    if len(all_sites) - n_unlinked > 30:
        all_sites = list(filter(lambda s: s['url'] is not None, all_sites))

    sites_by_category = defaultdict(list)
    for s in all_sites:
        sites_by_category[s['category']].append(s)

    return all_sites, sites_by_category


def build_trackers_list(data):
    tracker_list = data.trackers.sort_by(metric="reach")
    tracker_list_company = data.trackers.sort_by(
        metric="company_id",
        descending=False
    )
    header_stats = data.trackers.summary_stats()
    with open('_site/trackers.html', 'w') as output:
        output.write(render_template(
            template=get_template(data, name="trackers.html"),
            tracker_list=tracker_list,
            trackers_list_company=tracker_list_company,
            header_stats=header_stats
        ))
    write_json('_site/api/v2/trackers.json',
        tracker_list=tracker_list,
        trackers_list_company=tracker_list_company,
        header_stats=header_stats
    )
    print_progress(text="Generate tracker list")


def tracker_page_data(tracker_id, tracker, data):
    # Tracker Reach ts
    reach = data.trackers.get_reach(tracker_id)

    # tag cloud data
    all_sites, sites_by_cat = tag_cloud_data(tracker_id, data)

    # for horizontal bar chart in profile
    website_types = data.trackers.get_presence_by_site_category(tracker_id)

    return {
        "url": data.url_for("tracker", tracker_id),
        "app": tracker,
        "profile": data.trackers.get_tracker(tracker_id),  # profile-card hack
        "reach_ts": reach,
        "tracking_methods": data.trackers.get_tracking_methods(tracker_id),
        "website_list": all_sites,
        "sites_by_cat": sites_by_cat,
        "website_types": website_types[:5],  # top 5
        "similar_trackers": data.trackers.similar_trackers(tracker_id),
        "trackers": data.trackers.summary_stats()['count'],
    }


def tracker_page(template, data):
    reach = data['reach_ts']

    # page_reach trend line
    page_trend = Markup(ts_trend(ts=reach.get('page'), t=reach.get('ts')))

    # domain_reach trend line - may not reach all the way back in time
    site_trend = Markup(ts_trend(ts=reach.get('site'), t=reach.get('ts')[-len(reach.get('site')):], percent=False))

    with open(f'_site/{data["url"]}', 'w') as output:
        output.write(render_template(
            path_to_root='..',
            template=template,
            reach=recent_tracker_reach(reach),
            trends={'page': page_trend, 'site': site_trend},
            **data,
        ))

def build_tracker_pages(data):
    template = get_template(data, name='tracker-page.html', path_to_root='..')

    for (tracker_id, tracker) in data.trackers.iter():
        tracker_page(template, tracker_id, tracker, data)

    print_progress(text="Generate tracker pages")

def build_tracker_page_batch(batch):
    with DataSource(populate=False) as data:
        template = get_template(data, name='tracker-page.html', path_to_root='..')

        for tracker_id in batch:
            page_data = tracker_page_data(tracker_id,
                                        data.trackers.get_datapoint(tracker_id),
                                        data)
            write_json(f'_site/api/v2/trackers/{tracker_id}.json', **without_keys(page_data, "app"))
            tracker_page(template, page_data)
