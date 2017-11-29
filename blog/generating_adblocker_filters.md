title: Generating Ad-Blocker filters from whotracks.me data
subtitle: Let's never miss a new tracker again.
author: remusao
type: article
publish: True
date: 2017-11-20
tags: privacy, tracking, adblocking
header_img: blog/blog-generate-adb-filters.jpg
+++

*TL;DR*  In this post we see how to:

1. Load the data from [whotracks.me](https://github.com/cliqz-oss/whotracks.me) to get access to trackers' information
2. Create a mapping from tracking categories to list of domains
3. Filter each domain based on the amount of tracking of each *app*
3. Generate a filter list for each category

The full source code used in this article can be found on the [Github repository](https://github.com/cliqz-oss/whotracks.me/blob/master/contrib/generating_adblocker_filters.py).


Most popular content blockers are using filter lists to decide what requests
leaving the browser should be blocked. In this regard, filter lists act as a
privacy *ground truth*: deciding what is safe, and what is not safe for users.
It means that your privacy protection is only as good as the filters your are
using. The community is doing an amazing job, but still there can be gaps in
your protection; one such situation is when a new tracker appears.

With the right data, updated regularly, we believe it is possible to
build powerful tools to help increase users' privacy. Knowing more about
trackers, in real time, allows to provide better anti-tracking but can also
*help* the tedious process of curating the filter lists.

In this post we'd like to demonstrate how we can make use of the
open-sourced [whotracks.me](https://whotracks.me) data to automatically
generate *up-to-date*, *per-category*, filter lists supported by the
most popular ad-blockers out there. Leveraging this data can improve
user experience and make maintaining the lists easier.

In the future, we can imagine generating per-country lists as well,
in the spirit of the different [easylists](https://easylist.to/) already
in existence:

* `DEU: Pornvertising blocking Germany`
* `DEU: Site_Analytics blocking Germany`
* ...
* `FR: Site_Analytics blocking France`

They could also be dispatched in the already existing lists such as
`advertising`, `privacy`, etc. Another option could be to use this as a
tool to assist maintainers to keep an eye on the ecosystem; allowing to
learn about new trackers in real time.

Let's get started!

## Loading the data

The first step is to install the `whotracksme` package, available on [PyPI](https://pypi.python.org/pypi/whotracksme)
and [Github](https://github.com/cliqz-oss/whotracks.me). You can get started by
installing `whotracksme` with `pip`:

```sh
$ pip install whotracksme
```

We start by loading the tracker-related data from [trackerdb.sql](https://github.com/cliqz-oss/whotracks.me/blob/master/whotracksme/data/assets/trackerdb.sql), using the
helper function found in the `whotracksme.data` module:

```python
from collections import defaultdict
from whotracksme.data import load_tracker_db

# Categories to tracker domains
tracker_domains_per_category = defaultdict(list)

# Keep track of normalized "app" name for each tracker domain. A given "app"
# such as "doubleclick" can use several domains: 2mdn.net, doubleclick.net, etc.
tracker_domains_to_app = {}

# Load trackers and group them by category
sql_query = """
  SELECT categories.name, tracker, domain FROM tracker_domains
  INNER JOIN trackers ON trackers.id = tracker_domains.tracker
  INNER JOIN categories ON categories.id = trackers.category_id;
"""
with load_tracker_db() as connection:
    for (category, tracker, domain) in connection.execute(sql_query):
        tracker_domains_per_category[category].append(domain)
        tracker_domains_to_app[domain] = tracker
```

Here is a sample of what we get in `tracker_domains_per_category`. Note that if
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

## Filtering based on tracking behavior

It is tempting to generate filters for each domain loaded so far, but it
would be very aggressive. Indeed, some domains identified as potential
trackers might in fact not send [unsafe identifiers](https://whotracks.me/blog/what_is_a_tracker.html) (or not a lot). For example
[createjs](https://whotracks.me/trackers/createjs.html) is not using any
*fingerprinting* and does not seem to be doing tracking via *cookies*,
hence, it should not be blocked systematically.

Fortunately, we can make use of the data from [apps.json](https://github.com/cliqz-oss/whotracks.me/blob/master/whotracksme/data/assets/apps.json) to learn
more about each tracker. An *app* is an entity which can contain several
domains (e.g.: *doubleclick* is an *app* for which we identified three
domains: `2mdn.net`, `invitemedia.com` and `doubleclick.net`). We also
provide information about companies to which each app belongs, but we
will leave the exploration of this data for another article.

```python
import json
from whotracksme.data import load_apps

apps = load_apps()
```

`apps` is a dictionary with keys being *app ids* (e.g.: `google_analytics`)
and values containing all we know about each *app*. Let's take an example:

```json
apps["google_analytics"]

{
    "overview": {
        "bad_qs": 0.4377430033329568,
        "content_length": 14771.492718357234,
        "cookies": 0.0015869678941083753,
        "https": 0.7507222054912428,
        "id": "google_analytics",
        "reach": 0.44292899275150094,
        "requests": 3.834100333790446,
        "requests_tracking": 1.202157901660253,
        "site_reach": 0.616005569531587,
        "tracked": 0.4383474801843971
    },
    "history": ...,
    "rank": ...,
    "sites": ...
}
```

That's a lot of data, and we plan to release a more complete
documentation about what all this is about soon. For now let's just say
that everything is already made accessible on the website, in form of
nice graphs and aggregations!

For our use-case, we will only consider the field: `tracked`. It
represents the proportion of page loads including *app*, identified as
performing some form of tracking (using either identifying *cookies*
or *fingerprinting*). In the case of `google_analytics`, it means that
out of 100 page loads where `google_analytics` was present, tracking
occurred 44 times.

Before generating the filter list, let's keep only *apps* tracking
users more than `10%` of the time. Please note that finding the right
threshold would require some finer analysis, and could depend on the
application.

```python
def filter_domains(domains):
    for domain in domains:
        app_name = tracker_domains_to_app[domain]
        if app_name in apps:
            app = apps[tracker_domains_to_app[domain]]
            tracked = app['overview']['tracked']
            if tracked >= 0.1:
                yield domain
```

We need to check if the *app* exists first because we currently only have the
top 500 hosted on Github. We will host more in the future.


## Generating the lists

We now proceed to generate the filter lists from these domains. They can take
two forms:

* ADB compatible syntax: `||{domain}$third-party`
* Hostname syntax: `127.0.0.1 {domain}`

Note that the second option will probably be too aggressive in a lot of
cases, as it will also block the domain even if they are first-party (e.g.,
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
    category: '\n'.join(generate_adb_filters(filter_domains(domains)))
    for (category, domains) in tracker_domains_per_category.items()
}

# Generate filters with *hostname* syntax
hostname_filters = {
    category: '\n'.join(generate_hostname_filters(filter_domains(domains)))
    for (category, domains) in tracker_domains_per_category.items()
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

1. Load the data from [whotracks.me](https://github.com/cliqz-oss/whotracks.me) to get access to trackers' information
2. Create a mapping from tracking categories to list of domains
3. Filter each domain based on the amount of tracking of each *app*
3. Generate a filter list for each category

There is so much more we can do with this database. At the moment the
API to load the data is pretty-low level, but it will be improved over
time.
