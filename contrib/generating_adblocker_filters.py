
from collections import defaultdict, Counter
from whotracksme.data import load_tracker_db, load_apps

# Categories to tracker domains
trackers_by_category = defaultdict(list)
tracker_domains_to_app = {}

# Load trackers and group them by category
sql_query = """
  SELECT categories.name, tracker, domain FROM tracker_domains
  INNER JOIN trackers ON trackers.id = tracker_domains.tracker
  INNER JOIN categories ON categories.id = trackers.category_id;
"""
with load_tracker_db() as connection:
    for (category, tracker, domain) in connection.execute(sql_query):
        trackers_by_category[category].append(domain)
        tracker_domains_to_app[domain] = tracker

print(trackers_by_category)

apps = load_apps()


def filter_domains(domains):
    for domain in domains:
        app_name = tracker_domains_to_app[domain]
        if app_name in apps:
            app = apps[tracker_domains_to_app[domain]]
            tracked = app['overview']['tracked']
            if tracked >= 0.1:
                yield domain


def generate_adb_filters(domains):
    """Given a list of domains, generate filters using the
    ADB syntax to be used in an adblocker"""
    for domain in domains:
        yield f"||{domain}$third-party"

def generate_hostname_filters(domains):
    """Given a list of domains, generate filters using
    the hostname syntax"""
    for domain in domains:
        yield f"127.0.0.1 {domain}"

# Generate filters with *ADB* syntax
adb_filters = {
    category: '\n'.join(generate_adb_filters(filter_domains(domains)))
    for (category, domains) in trackers_by_category.items()
}

# Generate filters with *hostname* syntax
hostname_filters = {
    category: '\n'.join(generate_hostname_filters(filter_domains(domains)))
    for (category, domains) in trackers_by_category.items()
}


print(adb_filters['advertising'])
