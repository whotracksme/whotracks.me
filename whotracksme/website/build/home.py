
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
    
    # TODO: Remove, should not be needed anymore
    # apps = data.apps

    # sorted_trackers = data.apps.sort_by_prevalence()
    # sorted_trackers_cat = data.apps.sort_by_company()

    # for tracker in sorted_trackers:
    #     if 'name' not in tracker:
    #         tracker['name'] = tracker['overview']['id']

    # for tracker in sorted_trackers_cat:
    #     if 'name' not in tracker:
    #         tracker['name'] = tracker['overview']['id']

    # most tracked sites by cat
    most_tracked_sites = tracked_by_category(data.sites, descending=True)
    
    # least tracked sites by cat
    least_tracked_sites = tracked_by_category(data.sites, descending=False)

    top10 = company_reach(data.companies)
    header_graph = Markup(overview_bars(top10))

    with open('_site/index.html', 'w') as output:
        output.write(render_template(
            template=get_template(data, "index.html"),
            ts=header_graph,
            tracker_list=data.apps.sort_by_prevalence()[:20],
            trackers_list_cat=data.apps.sort_by_company()[:20],
            most_tracked_sites=most_tracked_sites,
            least_tracked_sites=least_tracked_sites,
            websites=data.sites.summary_stats(),
            # TODO: rename trackers to smth more meaningful
            trackers=data.apps.summary_stats(),
            top10=top10
        ))

    print_progress(text="Generate home page")
