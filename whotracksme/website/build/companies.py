
from collections import defaultdict
from jinja2 import Markup

from whotracksme.website.utils import print_progress
from whotracksme.website.templates import (
    get_template,
    render_template,
)
from whotracksme.website.plotting.companies import overview_bars
from whotracksme.website.plotting.colors import (
    tracker_category_colors, cliqz_colors
)


def get_company(companies, company_id):
    return companies.get(company_id, {})


def company_data(companies, company_id):
    data = companies.get_company(company_id)
    parent_id = data.get("parent_company")
    if parent_id != "None":
        data = companies.get_company(parent_id)
    return data


def get_company_name(company_dict):
    company_name = company_dict.get("overview").get("id")
    if company_dict.get("name"):
        company_name = company_dict.get("name").replace("/", " ")
    return company_name


def website_doughnout(site, data):
    d = defaultdict(int)

    site_trackers = data.sites.trackers.get_site(site).tracker
    ss = data.trackers.get_snapshot()
    category_counts = ss[ss.tracker.isin(site_trackers)]\
        .groupby('category').count().tracker.sort_values(ascending=False)
    category_dict = dict(category_counts.iteritems())

    return list(category_dict.values()), list(category_dict.keys()), category_counts.sum()


def tracker_map_data(site_id, data):
    nodes = []
    link_source = []
    link_target = []
    link_value = []
    link_label = []

    for (tracker, category, company) in data.sites.trackers_on_site(site_id, data.trackers, data.company_info):

        # category node index in nodes
        if category in nodes:
            cat_idx = nodes.index(category)
        else:
            nodes.append(category)
            cat_idx = len(nodes) - 1

        # company node index in nodes
        if company in nodes:
            com_idx = nodes.index(company)
        else:
            nodes.append(company)
            com_idx = len(nodes) - 1

        link_source.append(cat_idx)
        link_target.append(com_idx)
        link_label.append(tracker["name"])
        link_value.append(100.0 * tracker["frequency"])

    label_colors = [tracker_category_colors[l] if l in tracker_category_colors
                    else cliqz_colors["purple"] for l in nodes]

    return dict(
        node=dict(
            label=nodes,
            color=label_colors
        ),
        link=dict(
            source=link_source,
            target=link_target,
            value=link_value,
            label=link_label,
            color=["rgba(227, 163, 43, 0.2)"] * len(link_label)
        )
    )


def company_reach(companies, n=10):
    sorted_companies = companies.get_snapshot().sort_values('reach_rank', ascending=True)
    return sorted_companies[:n]


def company_page(template, company_data, data):
    company_data["logo"] = None
    company_id = company_data['overview']['id']

    company_name = get_company_name(company_data)
    with open(f'_site/{data.url_for("company", company_id)}', 'w') as output:
        output.write(render_template(
            path_to_root='..',
            template=template,
            demographics=company_data,
            initials=company_name[:2]
        ))


def build_company_pages(data):
    companies = data.companies
    template = get_template(data, "company-page.html")

    for company_data in companies.values():
        company_page(template, company_data, data)

    print_progress(text="Generate company pages")

def build_company_reach_chart_page(data):
    top100 = company_reach(data.companies, n=100)
    chart = Markup(overview_bars(top100, highlight=10, custom_height=3000))
    template = get_template(data, name='reach-chart-page.html', path_to_root='..')

    with open('_site/companies/reach-chart.html', 'w') as output:
        output.write(render_template(
            path_to_root='..',
            template=template,
            chart=chart,
        ))
        print_progress(text="Generate company reach chart")