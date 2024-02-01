from jinja2 import Markup

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

    write_json('_site/api/v2/index.json',
        ts=header_graph,
        tracker_list=tracker_list,
        trackers_list_company=trackers_list_company,
        most_tracked_sites=most_tracked_sites,
        least_tracked_sites=least_tracked_sites,
        websites=websites,
        tracker_stats=tracker_stats,
        top10=top10,
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
