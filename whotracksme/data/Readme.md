# WhoTracks.me Data

The data for the whotracks.me site is provided here as JSON files, with a SQL database containing tracker information. This document describes the format of the data provided in the `assets` directory.

## Tracker database

The tracker database is provided in the `assets/trackerdb.sql` file. This is a dump of a SQLite3 database containing the following tables:

 * `categories`: Categories for trackers (e.g. `advertising`, `social_media`).
 * `companies`: Metadata on companies: name, description, and various links.
 * `trackers`: Metadata on trackers: name, description, category, website and an optional link to a parent company.
 * `tracker_domains`: Table linking trackers to domain names.

## Data

The data is created by aggregating data about page loads per site, tracker and company, using the aforementioned tracker database. We calculate a standard set of signals across all aggregations:

 * `reach`: Proportional presence across all page loads (i.e. if a tracker is present on 50 out of 1000 page loads, the reach would be 0.05). Value is a float between 0 and 1.
 * `site_reach`: Presence across unique first party sites. e.g. if a tracker is present on 10 sites, and we have 100 different sites in the database, the site reach is 0.1. Value is a float between 0 and 1.
 * `https`: Proportion of pages where the tracker only used `HTTPS` traffic. Float between 0 and 1.
 * `cookies`: Proportion of pages where a cookie was sent by the browser, or a `Set-Cookie` header was returned by the tracker's server. Float between 0 and 1.
 * `bad_qs`: Proportion of pages where a unique identifier was detected in the query string parameters sent with a request to this tracker. The methodology for this detection can be found in [our paper](https://static.cliqz.com/wp-content/uploads/2016/07/Cliqz-Studie-Tracking-the-Trackers.pdf). Float between 0 and 1.
 * `tracked`: Proportion of pages where a unique identifier transmission was detected, either via `cookies` or `bad_qs`. Float between 0 and 1.
 * `content_length`: Average of `Content-Length` headers received per page. This is an approximate measure of the bandwidth usage of the tracker. Positive float.
 * `requests`: Average number of requests made to the tracker per page. Positive float.
 * `requests_tracking`: Average number of requests made to the tracker with tracking (cookie or query string) per page. Positive float.
 * `requests_failed`: Average number of requests make to the tracker per page which do not succeed. This is an approximate measure of blocking from external sources (i.e. adblocking extensions or firewalls). Positive float.
 * `has_blocking`: Proportion of pages where some kind of external blocking of the tracker was detected. Float between 0 and 1.

The following aggregations are provided in the files in `assets/`:

### Per tracker (`apps.json`)

This file contains aggregated data for entries from the `trackers` table in the database. Each tracker is defined as a set of 1 to many domains which should be aggregated under a single name. The `apps.json` file consists of a JSON object with keys being the `id`s as specified in the `trackers` database table. The values in the object contain:

 * `history`: An array of objects describing `reach` and `site_reach` for this tracker in the past. Each array entry is an object with keys `reach`, `site_reach` and `ts`. The latter is a date interval string in the format `YYYY-MM`, representing the month for this data point. The former two are aggregated signals as described above.
 * `overview`: An object containing the values of the above aggregate signals for the last month.
 * `rank`: A number showing the ranking of this entry in terms of `reach` for this month.
 * `sites`: An array of objects describing a subset of signals on different first-party sites where the tracker is present. Each object contains keys `site`, which is the name of the site for this sub-aggregation; `content_length`, `requests`, `requests_tracking` and `tracked`, which are the aggregated signals for the tracker and site pair; and `frequency` which is the proportion of the tracker's traffic which comes from this site.

### Per company (`companies.json`)

This file further aggregates trackers to a company level, using the parent company entry from the `trackers` database table. The format is the same as `apps.json`

### Global stats (`overview.json`)

This file contains an array of global aggregate stats, tracked over time. Each array element is an object with a subset of aggregate signals, and `ts` entry with the month in `YYYY-MM` format. Included is also a `trackers_hist` entry, which contains a histogram of the number of trackers per page.

### Per site (`sites.json`)

This file contains tracker information on top sites. Like for trackers and companies, this is a JSON object with keys being site names and values containing the data for that site. The site data consists of:

 * `apps`: An array containing information on the different trackers seen on this site. For each tracker there is an object with the `app` key referencing the tracker id (from the tracker database), `frequency` which shows the proportion of page loads on this site that the tracker was present for, and `content_length`, `requests`, `requests_tracking` and `tracked` signals.
 * `category`: A string category name for the site.
 * `history`: An array with overview stats for the site going back in time.
 * `name`: The name of the site
 * `overview`: The above aggregate signals for all page loads for this site.
 * `subdomains`: An object with keys being subdomains of the site's domain and their proportional traffic.

