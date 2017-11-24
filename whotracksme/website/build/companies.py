
from collections import defaultdict

from whotracksme.website.utils import print_progress
from whotracksme.website.templates import (
    get_template,
    render_template,
)
from whotracksme.website.plotting.colors import TrackerColors, CliqzColors


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


def website_doughnout(apps, site):
    trackers = site.get("apps")
    d = defaultdict(int)

    for t in trackers:
        try:
            apid = t.get("app", None)
            if apid is not None and apid != "None":
                app = apps[t.get("app")]

                cat = app.get("cat")
                if cat is None or cat == "None":
                    cat = "misc"
                d[cat] += 1
        except KeyError:
            pass

    values = []
    labels = []
    total = sum(d.values())
    for (k, v) in d.items():
        labels.append(k)
        values.append(v)
    return values, labels, total


def companies_present(companies, apps, site):
    trackers = site.get("apps")

    node_label = []
    link_source = []
    link_target = []
    link_value = []
    link_label = []

    for t in trackers:
        app_id = t["app"]
        try:
            app = apps[app_id]
        except:
            continue

        if 'name' not in app:
            app['name'] = app_id
        tracker_name = app["name"]
        category = app.get("cat", 'misc')
        if category == "extensions":
            continue
        if category not in TrackerColors:
            category = "misc"
        company_id = app.get("company_id")
        company = get_company(companies, company_id).get("name")
        if company is None:
            # tracker considered as company itself
            company = app.get("name")

        # TODO: This must be simpler
        if category in node_label:
            c_idx = node_label.index(category)
        else:
            node_label.append(category)
            c_idx = len(node_label) - 1
        if company in node_label:
            com_idx = node_label.index(company)
        else:
            node_label.append(company)
            com_idx = len(node_label) - 1
        link_source.append(c_idx)
        link_target.append(com_idx)
        link_label.append(tracker_name)
        link_value.append(100.0 * t["frequency"])

    label_colors = []
    for l in node_label:
        if l in TrackerColors:
            label_colors.append(TrackerColors[l])
        else:
            label_colors.append(CliqzColors["purple"])

    return {
        "node": {
            "label": node_label,
            "color": label_colors
        },
        "link": {
            "source": link_source,
            "target": link_target,
            "value": link_value,
            "label": link_label,
            "color": ["rgba(227, 163, 43, 0.2)"] * len(link_label)
        }
    }


def company_reach(companies):
    sorted_companies = sorted(companies.values(), key=lambda c: c['rank'])
    return sorted_companies[:10]

def company_page(template, company_data, data):
    company_data["logo"] = None
    company_id = company_data['overview']['id']

    company_name = get_company_name(company_data)
    with open('_site/{}'.format(data.url_for('company', company_id)), 'w') as output:
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
