# WhoTracks.me Data

The data for the whotracks.me site is provided here as JSON files, with a SQL database containing tracker information. This document describes the format of the data provided in the `assets` directory.

## Tracker database

The tracker database is provided in the `assets/trackerdb.sql` file. This is a dump of a SQLite3 database containing the following tables:

 * `categories`: Categories for trackers (e.g. `advertising`, `social_media`).
 * `companies`: Metadata on companies: name, description, and various links.
 * `trackers`: Metadata on trackers: name, description, category, website and an optional link to a parent company.
 * `tracker_domains`: Table linking trackers to domain names.

## Data

The data is created by aggregating data about page loads at several different levels. These aggregated stats are published in the following files:

 * `domains.csv`: Top third-party domains seen tracking.
 * `trackers.csv`: Top trackers - this combines domains known be operated by the same tracker.
 * `companies.csv`: Top companies - aggregates the stats for trackers owned by the same company.
 * `sites.csv`: Stats for number of trackers seen on popular websites.
 * `site_trackers.csv`: Stats for each tracker on each site.

We calculate a standard set of signals across all aggregations:

 * `cookies`: Proportion of pages where a cookie was sent by the browser, or a `Set-Cookie` header was returned by the tracker's server. Float between 0 and 1.
 * `bad_qs`: Proportion of pages where a unique identifier was detected in the query string parameters sent with a request to this tracker. The methodology for this detection can be found in [our paper](https://static.cliqz.com/wp-content/uploads/2016/07/Cliqz-Studie-Tracking-the-Trackers.pdf). Float between 0 and 1.
 * `tracked`: Proportion of pages where a unique identifier transmission was detected, either via `cookies` or `bad_qs`. Float between 0 and 1.
 * `https`: Proportion of pages where the tracker only used `HTTPS` traffic. Float between 0 and 1.
 * `requests`: Average number of requests made to the tracker per page. Positive float.
 * `requests_tracking`: Average number of requests made to the tracker with tracking (cookie or query string) per page. Positive float.
 * `content_length`: Average of `Content-Length` headers received per page. This is an approximate measure of the bandwidth usage of the tracker. Positive float.
 * `requests_failed`: Average number of requests make to the tracker per page which do not succeed. This is an approximate measure of blocking from external sources (i.e. adblocking extensions or firewalls). Positive float.
 * `has_blocking`: Proportion of pages where some kind of external blocking of the tracker was detected. Float between 0 and 1.

There are also signals for the frequency with which certain resource types are loaded by third-parties:

 * `script`: Javascript code (via a `<script>` tag or web worker).
 * `iframe`: A subdocument (via `<frame>` or `<iframe>` elements).
 * `beacon`: Requests sent through the [Beacon API](https://developer.mozilla.org/en-US/docs/Web/API/Beacon_API).
 * `image`: Image and imageset resources.
 * `stylesheet`: [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS) files.
 * `font`: Custom fonts.
 * `xhr`: Requests made from scripts via the [XMLHttpRequest](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest) or [fetch](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API) APIs.
 * `plugin`: Requests of `object` or `object_subrequest` types, which are typically associated with browser plugins such as Flash.
 * `media`: Requests loaded via `<video>` or `<audio>` HTML elements.

We also count the presences of other entities in the aggregation. This enables us to, for example, count how many of a tracker's domains they use simultaneously on average, or how many different trackers and companies are usually present on sites:

 * `hosts`
 * `trackers`
 * `companies`

For domain, trackers and companies aggregations we also include two extra measures:

 * `reach`: Proportional presence across all page loads (i.e. if a tracker is present on 50 out of 1000 page loads, the reach would be 0.05). Value is a float between 0 and 1.
 * `site_reach`: Presence across unique first party sites. e.g. if a tracker is present on 10 sites, and we have 100 different sites in the database, the site reach is 0.1. Value is a float between 0 and 1.

The files are organised monthly with the following structure: `assets/{month}/{country}/{file}.csv`
