from markupsafe import Markup
from whotracksme.website.plotting.companies import overview_bars
from whotracksme.website.build.companies import company_reach
from whotracksme.website.utils import print_progress, write_json
from whotracksme.website.templates import get_template, render_template
from whotracksme.website.build.blog import load_blog_posts


def build_home(data):
    top10 = company_reach(data.companies)
    header_graph = Markup(overview_bars(top10))

    posts = load_blog_posts()[:3]

    tracker_list = data.trackers.sort_by(metric="reach")[:20]
    trackers_list_company = data.trackers.sort_by(metric="company_id")[:20]
    most_tracked_sites = data.sites.sort_by(metric='trackers')[:20]
    least_tracked_sites = data.sites.sort_by(metric='trackers', descending=False)[:20]
    websites = data.sites.summary_stats()
    tracker_stats = data.trackers.summary_stats()

    # Compute key tracking stats for the "Did you know?" section
    google_company = data.companies.get_company('google')
    google_reach = (google_company.reach * 100) if google_company else 0

    facebook_company = data.companies.get_company('facebook')
    facebook_pixel_reach = (facebook_company.site_reach_top10k / 10000 * 100) if facebook_company else 0

    key_tracking_stats = {
        'google_reach': round(google_reach, 1),
        'facebook_pixel_reach': round(facebook_pixel_reach, 1),
        'trackers_using_cookies': round(tracker_stats['by_cookies'] * 100, 1),
        'traffic_with_trackers': round(websites['have_trackers'] * 100, 1),
        'tracking_requests_per_page': int(round(websites['tracker_requests'])),
        'average_trackers_per_site': int(round(websites['average_nr_trackers'])),
        'sites_with_over_10_trackers': websites['gt10'],
        'data_used_by_trackers_mb': round(websites['data'] / (1024 * 1024), 0),
    }

    write_json('_site/api/v2/index.json',
        tracker_list=tracker_list,
        trackers_list_company=trackers_list_company,
        most_tracked_sites=most_tracked_sites,
        least_tracked_sites=least_tracked_sites,
        websites=websites,
        tracker_stats=tracker_stats,
        top10=top10,
        key_tracking_stats=key_tracking_stats,
    )

    with open('_site/index.html', 'w') as output:
        output.write(render_template(
            template=get_template(data, "index.html"),
            ts=header_graph,
            tracker_list=tracker_list,
            trackers_list_company=trackers_list_company,
            most_tracked_sites=most_tracked_sites,
            least_tracked_sites=least_tracked_sites,
            websites=websites,
            tracker_stats=tracker_stats,
            top10=top10,
            posts=posts
        ))

    print_progress(text="Generate home page")


def build_privacy_policy(data):
    with open('_site/privacy-policy.html', 'w') as output:
        output.write(render_template(
            template=get_template(data, "privacy-policy.html"),
        ))

    print_progress(text="Generate Privacy Policy")


def build_imprint(data):
    with open('_site/imprint.html', 'w') as output:
        output.write(render_template(
            template=get_template(data, "imprint.html"),
        ))

    print_progress(text="Generate Imprint")
