from jinja2 import Markup

from whotracksme.website.plotting.companies import overview_bars
from whotracksme.website.build.companies import company_reach
from whotracksme.website.utils import print_progress
from whotracksme.website.templates import get_template, render_template


def build_home(data):
    top10 = company_reach(data.companies)
    header_graph = Markup(overview_bars(top10))

    with open('_site/index.html', 'w') as output:
        output.write(render_template(
            template=get_template(data, "index.html"),
            ts=header_graph,
            tracker_list=data.trackers.sort_by(metric="reach")[:20],
            trackers_list_company=data.trackers.sort_by(metric="company_id")[:20],
            most_tracked_sites=data.sites.sort_by(metric='trackers')[:20],
            least_tracked_sites=data.sites.sort_by(metric='trackers', descending=False)[:20],
            websites=data.sites.summary_stats(),
            tracker_stats=data.trackers.summary_stats(),
            top10=top10
        ))

    print_progress(text="Generate home page")
