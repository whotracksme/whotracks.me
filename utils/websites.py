from collections import OrderedDict, defaultdict
from statistics import mean
from plotting.utils import arrow_style


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
