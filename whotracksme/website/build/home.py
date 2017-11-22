
from jinja2 import Markup

from whotracksme.website.plotting.companies import overview_bars

from whotracksme.website.build.websites import tracked_by_category
from whotracksme.website.build.companies import company_reach
from whotracksme.website.utils import print_progress
from whotracksme.website.templates import (
    get_template,
    render_template,
)


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
