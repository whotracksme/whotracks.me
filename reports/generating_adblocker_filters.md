title: Generating Ad-Blocker filters from whotracks.me data
subtitle: Let's never miss a new tracker again.
author: Privacy Knight
type: article
publish: True
date: 2017-11-20
tags: privacy, tracking, adblocking
header: blog/blog-cookies.jpg
+++


In this post I'd like to demonstrate how we can make use of the
open-sourced [whotracks.me](https://whotracks.me) data to automatically
generate *up-to-date*, *per-category*, filters lists supported by the
most popular ad-blockers out there. While it might not immediately
seem useful, leveraging this data can improve user experience and make
maintaining the lists much easier.

In the future, we can also imagine generating per-country lists as well,
in the spirit of the different *easylists* already in existence:

* `DEU: Pornvertising blocking Germany`
* `DEU: Site_Analytics blocking Germany`
* ...
* `FR: Site_Analytics blocking Germany`

They could also be dispatched in the already existing lists such as
`advertising`, `privacy`, etc. Another option could be to use this as
a tool to assist maintainers to keep an eye on the ecosystem; learning
about new trackers in real time certainly seems useful.

Let's get started!

## Loading the data

We start by loading the tracker-related data from `trackerdb.sql`, using the
helper function found in `trackerdb.py`. Both files are located in the `db`
folder at the root of the repository.

```python
from trackerdb import load_tracker_db
from collections import defaultdict

# Categories to tracker domains
trackers_by_category = defaultdict(list)

# Load trackers and group them by category
sql_query = """
  SELECT categories.name, domain FROM tracker_domains
  INNER JOIN trackers ON trackers.id = tracker_domains.tracker
  INNER JOIN categories ON categories.id = trackers.category_id;
"""
with load_tracker_db() as connection:
    for (category, domain) in connection.execute(sql_query):
        trackers_by_category[category].append(domain)
```

Here is a sample of what we get in `trackers_by_category`. Note that if
you run the same script, you might get slightly different results as the
data is being constantly updated:

```python
defaultdict(list, {
  'advertising': [
    'doubleclick.net',
    ...
  ],
  'audio_video_player': [
    'soundcloud.com'
    ...
  ],
  'cdn': [
    'googleapis.com',
    ...
  ],
  'comments': [
    'disqus.com',
    ...
  ],
  'customer_interaction': [
    'zendesk.com',
    ...
  ],
  'essential': [
    'googletagmanager.com',
    ...
  ],
  'extensions': [
    'kaspersky-labs.com',
    ...
  ],
  'hosting': [
    'amazonaws.com',
    ...
  ],
  'misc': [
    'linkedin.com',
    ...
  ],
  'pornvertising': [
    'pornhub.com',
    ...
  ],
  'site_analytics': [
    'google-analytics.com',
    ...
  ],
  'social_media': [
    'twitter.com',
    ...
  ]
]})
```

## Generating the lists

We now proceed to generate the filter lists from these domains. They can take
two forms:

* ADB compatible syntax: `||{domain}$third-party`
* Hostname syntax: `127.0.0.1 {domain}`

Note that the second option will probably be too aggressive in a lot of
cases, as it will also block the domain even if they are *first-party* (e.g.,
`google.com` might get blocked by these rules).

```python
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
    category: '\n'.join(generate_adb_filters(domains))
    for (category, domains) in trackers_by_category.items()
}

# Generate filters with *hostname* syntax
hostname_filters = {
    category: '\n'.join(generate_hostname_filters(domains))
    for (category, domains) in trackers_by_category.items()
}
```

Each dictionary now contains a valid adblocking list for each category:

```python
hostname_filters.keys()
```

```python
dict_keys([
  'advertising',
  'audio_video_player',
  'cdn',
  'comments',
  'customer_interaction',
  'essential',
  'extensions',
  'hosting',
  'misc',
  'pornvertising',
  'site_analytics',
  'social_media',
  'unknown'
])
```


And here is what we get for example in the `advertising` category:

```python
print(adb_filters['advertising'])
```

```
||doubleclick.com$third-party
||criteo.com$third-party
...
```


And the same domains but as `hostname` filters:

```python
print(hostname_filters['advertising'])
```

```
127.0.0.1 doubleclick.com
127.0.0.1 criteo.com
...
```

To put it in a nutshell, here is what we just did:

1. Load the data from `whotracks.me` to get access to tracker's information
2. Create a mapping from tracking categories to list of domains
3. Generate a filter list for each category

There is so much more we can do with this database. At the moment the
API to load the data is pretty-low level, but it will be improved over
time.
