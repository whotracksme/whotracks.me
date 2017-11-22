
from collections import OrderedDict, defaultdict
from statistics import mean

from jinja2 import Markup

from whotracksme.website.plotting.utils import arrow_style
from whotracksme.website.utils import print_progress
from whotracksme.website.build.companies import (
    companies_present,
    website_doughnout,
)
from whotracksme.website.templates import (
    get_template,
    render_template,
)

from whotracksme.website.plotting.plots import profile_doughnut
from whotracksme.website.plotting.sankey import alluvial_plot



def sort_by_rank(sites):
    if isinstance(sites, dict):
        sorted_websites = sorted(sites.values(), key=lambda a: a['overview']['popularity'], reverse=True)
    else:
        sorted_websites = sorted(sites, key=lambda a: a['overview']['popularity'], reverse=True)
    current_rank = 1
    for site in sorted_websites:
        site['rank'] = current_rank
        current_rank += 1
    return sorted_websites


def tracked_by_category(sites, worst=True):
    top = defaultdict(list)
    sorted_by_tracked = sorted(sites.values(), key=lambda a: a['overview']['mean_trackers'], reverse=worst)
    for s in sorted_by_tracked:
        if len(top[s["category"].strip()]) < 2 and s["category"] not in [" ", ""]:
            top[s["category"].strip()].append(s["overview"])
    return top


def sort_by_cat(sites):
    if isinstance(sites, dict):
        sorted_websites = sorted(sites.values(), key=lambda a: '' if 'category' not in a or 'category' in a and a['category'] is None else a['category'], reverse=True)
    else:
        sorted_websites = sorted(sites, key=lambda a: '' if 'category' not in a or 'category' in a and a['category'] is None else  a['category'], reverse=True)
    return sorted_websites


def summary_stats(sites):
    tracker_requests = []
    tracker_buckets = {
        "0": 0,
        "1": 0,
        "2": 0,
        "3": 0,
        "4": 0,
        "5": 0,
        "6": 0,
        "7": 0,
        "8": 0,
        "9": 0,
        "> 9": 0,
    }
    https = []

    for domain, site in sites.items():
        tracker_requests.append(site['overview']['requests_tracking']/site['overview']['requests'])
        https.append(site['overview']['https'])
        if int(site['overview']['mean_trackers']) < 10:
            tracker_buckets[str(int(site['overview']['mean_trackers']))] += 1
        else:
            tracker_buckets["> 9"] += 1
    return (
        round(mean(tracker_requests), 1),
        OrderedDict(sorted(tracker_buckets.items(), key=lambda x: x[0])),
        round(mean(https), 1)
    )


def top_tracking_category(apps, site):
    """
    :param apps: trackers (apps.json)
    :param site: website (e.g. audible.de)
    :return: most prevalent tracker category
    """
    if len(site["apps"]) > 0:
        return apps.get(site["apps"][0]).get('category')
    return


def tracking_methods(site):
    # Reducing values to booleans
    methods = {
        "cookies": False,
        "fingerprinting": False
    }
    if site.get("overview", {}).get("cookies") > 0.2:
        methods["cookies"] = True
    if site.get("overview", {}).get("bad_qs") > 0.1:
        methods["fingerprinting"] = True
    return methods


def changes(site):
    change_in = defaultdict(dict)
    overview = site.get("overview")
    history = site.get("history")

    try:
        nr_trackers_change = abs(round(100*(history[-1]["mean_trackers"] - history[-2]["mean_trackers"]), 1))
    except IndexError:
        # it means we don't have enough history
        nr_trackers_change = 0

    background_color, color, class_name = arrow_style(nr_trackers_change)

    change_in["nr_trackers"] = {
        "value": nr_trackers_change,
        "background_color": background_color,
        "color": color,
        "class": class_name
    }
    return change_in


def header_stats(sites):
    have_trackers = []
    average_nr_trackers = []
    tracker_requests = []

    for sid, s in sites.items():
        have_trackers.append(s['overview']['tracked'])
        average_nr_trackers.append(s['overview']['mean_trackers'])
        tracker_requests.append(s["overview"]["requests_tracking"])
    return {
        "have_trackers": mean(have_trackers),
        "average_nr_trackers": mean(average_nr_trackers),
        "tracker_requests": int(mean(tracker_requests))
    }

def build_website_list(data):
    sites = data.sites
    tracker_requests, tracker_buckets, https = summary_stats(data.sites)

    # header stats
    tracker_values = []
    tracker_labels = []
    for (k, v) in tracker_buckets.items():
        tracker_values.append(v)
        tracker_labels.append(k)

    header_numbers = header_stats(data.sites)

    sorted_websites = sort_by_rank(data.sites)
    sorted_websites_cat = sort_by_cat(data.sites)

    # write to file
    with open('_site/websites.html', 'w') as output:
        output.write(render_template(
            template=get_template(data, "websites.html"),
            website_list=sorted_websites,
            website_list_cat=sorted_websites_cat,
            header_numbers=header_numbers
        ))
    print_progress(text="Generate website list")


def website_page(template, site_id, rank, data):
    companies = data.companies
    apps = data.apps
    site = data.sites.get(site_id)
    profile = {
        "rank": rank,
        "website_url": site["overview"]["site"],
        "name":  site["overview"]["site"],
        "overview": site["overview"]
    }

    methods = tracking_methods(site)
    tracker_changes = changes(site)

    # tracker presence data
    sankey_data = companies_present(companies, apps, site=site)
    d_values, d_labels, d_total = website_doughnout(apps, site)
    profile_dough = Markup(profile_doughnut(d_values, d_labels, d_total))

    real_sankey = Markup(alluvial_plot(sankey_data))

    # apps per site data
    apps_table = []
    for a in site.get("apps"):
        f = a.get("frequency")
        apid = a.get("app")
        if apps.get(apid):
            appdict = apps.get(apid)
            appdict["frequency"] = f
            apps_table.append(appdict)

    sorted_trackers = sorted(apps_table, key=lambda a: a['frequency'], reverse=True)
    sorted_trackers_cat = sorted(apps_table, key=lambda a: a.get("company_id", "") if a.get("company_id") is not None else "")

    # write to file
    with open('_site/websites/{}.html'.format(site["name"]), 'w') as output:
        output.write(render_template(
            path_to_root='..',
            template=template,
            site=site,
            profile=profile,
            methods=methods,
            tracker_changes=tracker_changes,
            sankey=real_sankey,
            doughnut=profile_dough,
            tracker_categories=d_labels,
            tracker_list=sorted_trackers,
            trackers_list_cat=sorted_trackers_cat
        ))


def build_website_pages(data):
    sites = data.sites
    template = get_template(data, "website-page.html", path_to_root='..')

    for rank, (site_id, site) in enumerate(sorted(sites.items(), key=lambda s: s[1]['overview']['popularity'], reverse=True)):
        website_page(template, site_id, rank + 1, data)

    print_progress(text="Generate website pages")


