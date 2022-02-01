# Data

The data for the whotracks.me site is provided here as JSON files, with a SQL database containing tracker information. This document describes the format of the data provided in the `assets` directory.

## How to get the data

You have two options to work with the raw data:
1. Explore the raw data from last month through the web site
1. Download the data locally (including historic data)

### Use the Explorer on the whotracks.me website

The last month can be directly accessed from website:
https://whotracks.me/explorer.html

> Note: The meaning of the column in the explorer in explained in this document (see below).

### Download raw data

You can also download the datasets from the publicly available Amazon S3 bucket.

First, you need to install the AWS CLI client:

- [Linux](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html)
- [MacOS](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html)
- [Windows](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html)

> Note: When building the website, the data is expected to be in `<repo-root>/whotracksme/data/assets` folder.

To download one month of data (e.g. October 2022):

```sh
cd <repo-root>/data/assets
aws s3 sync --no-sign-request s3://data.whotracks.me/2022-10 .
```

You can also download historic data (back to `2017-05`)):

```sh
cd <repo-root>/data/assets
aws s3 sync --no-sign-request s3://data.whotracks.me/ .
```

## Tracker database

The tracker database is provided in the `assets/trackerdb.sql` file. This is a dump of a SQLite3 database containing the following tables:

 * `categories`: Categories for trackers (e.g. `advertising`, `social_media`).
 * `companies`: Metadata on companies: name, description, and various links.
 * `trackers`: Metadata on trackers: name, description, category, website and an optional link to a parent company.
 * `tracker_domains`: Table linking trackers to domain names.

This SQL database links third-party domains to trackers, which are then linked to unique companies operating those trackers. This is similar to [Disconnect's Tracker List](https://github.com/disconnectme/disconnect-tracking-protection) and [webXray's Domain Owner List](https://github.com/timlib/webXray_Domain_Owner_List#webxray-domain-owner-list). These parties are already categorized accordingly within the WhoTracks.me datasets below.

## WhoTracks.me datasets

WhoTracks.me datasets are provided monthly in the `assets//{month}/{country}/{file}.csv` format. A glimpse of the datasets is available in [Explorer](https://whotracks.me/explorer.html) section on the website.

### Data collection

Data was collected from May 2017 from users that used Cliqz browser extension. In Feb 2018, 70% of the data came from German users according to [this](https://whotracks.me/blog/update_feb_2018.html) blog post. Then in March 2018, users of Ghostery FireFox extension - and Ghostery extension available for other browsers (Safari, Chrome, Opera and Edge) from users that opted-in to *HumanWeb* data collection - were added to the dataset. This caused a slight decrease in the avg. no. of trackers in April 2018, since Ghostery users were blocking more trackers. This is explained in [this](https://whotracks.me/blog/where_is_the_data_from.html) and [this](https://whotracks.me/blog/update_apr_2018.html) blog posts.

[This](https://whotracks.me/blog/update_apr_2018.html) blog post illustrates where the traffic came from in April 2018: Germany and USA being most representative.

[This](https://cliqz.com/en/magazine/government-websites-leak-data-to-google-co) blog post notes that WhoTracks.me does not collect data for pages with no trackers; in other words, collected data for all sites contains some number of third-parties and tracking.

### Datasets

There are 5 main datasets on - unlike 4 datasets available in [Explorer](https://whotracks.me/explorer.html) section on the website:

 * `sites.csv`: Stats for number of trackers seen on popular websites.
 * `site_trackers.csv`: Stats for each tracker on each site.
 * `domains.csv`: Top third-party domains seen tracking.
 * `trackers.csv`: Top trackers - this combines domains known be operated by the same tracker.
 * `companies.csv`: Top companies - aggregates the stats for trackers owned by the same company.

> "We structure each subsection in a way that describes measurements in the perspective of the parties involved: websites, third parties and users. This enables us to better measure the dynamics of the industry."

### Variable descriptions

The data is created by aggregating data about page loads at several different levels. Therefore, all 5 above datasets share similar aggregated variables. The difference therefore, lies in the *perspective* of each dataset. Variable descriptions ("contexts" are added to variables for groupings) are given below:

**General context**:

 * `site` - one of the most frequently visited websites from a proportion of traffic in certain month. That means that the most popular websites in the dataset were not generated by Alexa or similar services, but by real users. Total number of published most-visited-user-generated sites increased over time: e.g. from 700 most visited sites in 2017 to over 1000 sites in 2020 in Global datasets. Note: average monthly traffic (page loads) of users was around 100 million page loads during 2017, and increased to 300-500 million page loads from April 2018 onward (as described in [this](https://arxiv.org/pdf/1804.08959.pdf#page=2) part of WhoTracks.me paper). String.

 * `month` - month of observation. Global traffic data starts from May 2017 and ends with latest GitHub release; EU/US traffic split starts from April 2018 and ends with latest GitHub release. mm-yyyy format string/date.
 
 * `country` - main region where the traffic is coming from: e.g. global, US, EU, DE, FR. String.
 
 * `category` - site's category (in `sites.csv`). Descriptions of website categories (first-parties) are provided [here](https://arxiv.org/pdf/1804.08959v1.pdf#page=14) in Appendix A. String.
 
 * `tracker_category` - tracker's category (in `sites_trackers.csv`). Descriptions of tracker categories are provided [here](https://whotracks.me/blog/tracker_categories.html). String.
 
 * `popularity` - the relative amount of traffic compared to the most popular site (described [here](https://whotracks.me/blog/updating_our_tracking_prevalence_metrics.html)). Float between 0 and 1.
 
**Utilised tracking context (stateful)** – generates more persistant tracking ID by trackers:
 
 * `cookies` - proportion of pages where a cookie was sent by the browser, or a `Set-Cookie` header was returned by the tracker's server. Float between 0 and 1.
 
**Utilised tracking context (stateless)** – generates less persistant tracking ID by trackers:
 
 * `bad_qs` - proportion of pages where a unique identifier (UID) was detected in the query string parameters sent with a request to this tracker. More on this [here](https://en.wikipedia.org/wiki/Query_string#Tracking). The methodology for this detection can be found in [the paper](https://www.researchgate.net/publication/312638031_Tracking_the_Trackers). Float between 0 and 1.
 
> "Note that these detection methods assume that trackers are not obfuscating the identifiers they generate."
 
**Utilised tracking context (stateful + stateless)** – either cookie tracking or fingerprinting context, inclusive:

 * `tracked` - proportion of pages where a UID transmission was detected, either via `cookies` or `bad_qs`. Float between 0 and 1.
 
> "We define tracking as when a service is able to collect and correlate data across multiple sites."
 
**Secure context** – tracker used HTTPS requests - instead of HTTP - to load its content:

 * `https` - proportion of pages where the tracker only used `HTTPS` traffic. Float between 0 and 1.
 
**Tracking requests context** – we report the mean number of third-party requests per page for each tracker, and the subset of these requests in a tracking context:

 * `requests` - average number of requests made to the tracker per page. Positive float.
 
 * `requests_tracking` - average number of requests made to the tracker with tracking (cookie or query string) per page. Positive float.
 
**Tracking cost context** - how much page loads do trackers clog up by being loaded, more on this in the [Tracker Tax paper](https://web.archive.org/web/20180711021626/https://www.ghostery.com/wp-content/themes/ghostery/images/campaigns/tracker-tax/Ghostery_Study_-_The_Tracker_Tax.pdf):
 
 * `content_length` - average of `Content-Length` headers received per page. This is an approximate measure of the bandwidth usage of the tracker. Expressed in bytes. Positive float.
 
> "As users navigate the web, they load content from websites they visit as well as the third parties present on the website. ... Previous studies have found that each extra third party added to the site will contribute to an increase of 2.5% in the site’s loading time."
 
**Tracker's blocking context** – how often the tracker is affected by blocklist-based blockers:
 
 * `requests_failed` - average number of requests make to the tracker per page which do not succeed. In other words, avg. number of failed requests per page load (for comparison with `requests` to get an idea of how aggressive the blocking is). This is an approximate measure of blocking from external sources (i.e. adblocking extensions or firewalls). Measure [added](https://whotracks.me/blog/update_dec_2017.html) in Dec 2017. Positive float.
 
 * `has_blocking` - proportion of pages where some kind of external blocking of the tracker was detected.Measure [added](https://whotracks.me/blog/update_dec_2017.html) in Dec 2017. Float between 0 and 1.
 
> "These signals [`requests_failed` and `has_blocking`] should be able to tell us something about the impact of blocking on different trackers in the ecosystem. For example, we see evidence of blocking 40% of the time for Google Analytics and Facebook [in Dec 2017], and between 10% and 20% of requests failing. Thus, anyone using these services to measure activity and conversions on their sites must reckon with error rates in these orders. We also can see how new entrants can initially avoid the effects of blocking - for Tru Optik and Digitrust who we mentioned earlier, we measure only 5 and 1% of pages which may be affected by blocking."
 
**Tracker's content loading context** – proportion of page loads where specific resource types were loaded by the tracker (e.g. scripts, iframes, plugins)

Signals for the frequency with which certain resource types are loaded by third-parties (measures [added](https://whotracks.me/blog/update_feb_2018.html) in Feb 2018):
 
 * `script` - JavaScript code (via a `<script>` tag or web worker).
 
 > "If a third-party Javascript file is loaded into the page, the third-party is given the ability to modify the page at will, intercept all user input on the page, as well as load any other scripts or third parties they wish. ... any third-party which is permitted to load Javascript in the login document will have to ability to read users’ login information inputted into this page."
 
 * `iframe` - a subdocument (via `<frame>` or `<iframe>` elements).
 
> "Content loaded into an iFrame context is safer, as this is a sandboxed environment."
 
 * `beacon` - requests sent through the [Beacon API](https://w3c.github.io/beacon/). More on this [here](https://whotracks.me/blog/tracking_pixel.html):
 
> "A tracking pixel, is one of various techniques used on web pages or email, to unobtrusively (usually invisibly) allow checking that a user has accessed some content."
 
 * `image` - image and imageset resources.
 
 > "Loading third-party images in the page allows the third-party to know the page you’re visiting, via the Referer header, your IP address, and may allow them to further track your browser via Cookies"
 
 * `stylesheet` - [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS) files.
 
 * `font` - custom fonts.
 
 * `xhr` - requests made from scripts via the [XMLHttpRequest](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest) or [fetch](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API) APIs.
 
 * `plugin` - requests of `object` or `object_subrequest` types, which are typically associated with browser plugins such as Flash.
 
 * `media` - requests loaded via `<video>` or `<audio>` HTML elements.

> "By reporting these [above resource types] values we can further characterize tracker behaviours, and quantify risks, such as which trackers are being permitted to load scripts on certain pages. With this data we can see that, for example, Google Analytics loads their script on each page load (98% of the time), then registers the visit via a pixel on 59% of page loads. We also see that on 6% of pages a request is also made via the Beacon API. Similarly, if we look at the Webtrekk tracker, which is present on many popular German websites, we can see that on sensitive websites such as banking (dkb.de) and health insurance (tk.de), the tracker is loaded without scripts. This is at least an indication that in certain contexts website owners are taking care to minimise the potential risk of a third-party being compromised and gathering sensitive information from the page, or even collecting sensitive information by mistake."


**Tracker's presence context** – there are also counts of presences of other entities in the aggregation. This enables us to, for example, count how many of a tracker's domains they use simultaneously on average, or how many different trackers and companies are usually present on sites:

 * `hosts` - avg. number of tracker's domains present on site. Several domains are grouped under `trackers`, e.g.: `facebook.com` and `facebook.net`grouped under `facebook` tracker. Positive float.
 
 * `trackers` - avg. number of [trackers](https://whotracks.me/blog/what_is_a_tracker.html) present on site. Trackers are grouped under `companies`, e.g.: `facebook`, `facebook_cdn`, `facebook_graph`, `...`, grouped under Facebook. Positive float.
 
> "We define a 'tracker' as a third-party domain which is:
a) present on multiple ( > 10 ) different websites with a significant combined traffic,
b) uses cookies or fingerprinting methods in order to transmit user identifiers"
 
 * `companies` - avg. number of companies present on site. Positive float.
 
**Tracker reach context** – for domain, trackers and companies aggregations, there are two extra measures:

 * `reach`: Proportional presence across all page loads (i.e. if a tracker is present on 50 out of 1000 page loads, the reach would be 0.05). Value is a float between 0 and 1.

> "We define a tracker or company’s ‘reach’ as the proportion of the web in which they are included as a third-party."

 * `site_reach`: Presence across unique first party sites. e.g. if a tracker is present on 10 sites, and we have 100 different sites in the database, the site reach is 0.1. Value is a float between 0 and 1. 
 
> "Alternatively, we can measure ‘site reach’, which is the proportion of websites (unique first-party hostnames) on which this tracker has been seen at least once."
 
Note: This measure was redefined in Feb 2019 as `site_reach_top10k`: the number of sites in the top 10,000 which have this tracker on more than 1% of page loads" according to [this](https://t.ly/Ra6z) blog post. A further value, `site_avg_frequency` gives the mean presence across these sites. Positive floats.
 
> "Given that the top 10,000 sites account for 75% of page loads in our data, we decided to measure the presence across this fixed set of sites."
 
Differences between `reach` and `site_reach` (according to above blog post):

 * High reach and high site reach - Ubiquitous presence across both popular and less popular sites; A common example of that would be Google Analytics.
 * High reach and low site reach - Present primarily on few popular, high-traffic sites; One such example would be Wikimedia, which, due to Wikipedia's popularity, is loaded very often (hence high reach), but present on few sites resulting in a low(er) site reach. Another example, for similar reasons, would be Ebay Stats,
 * Low reach and high site reach - Only appearing rarely on many sites, e.g. only on a small number of pages for each site; In this category appear extensions that operate as "man in the middle", such as Kaspersky Labs.
 * Low reach and low site reach - Present on few lower-traffic sites. This includes smaller trackers.

**Latest measures added**:

 * `referer_leaked_header` -  the full site url was sent to a tracker via the `Referer` HTTP header.
 
 * `referer_leaked_url` - the full site url was sent to a tracker via URL parameters.
 
 * `referer_leaked` - one (or both) of the above happened.
 
 * `cookie_samesite_none` - see this [documentation](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Set-Cookie/SameSite). Sending the cookie attribute `SameSite: None` is a way of explicitly stating that the server wants to receive cookies from multiple different sites (i.e. that this cookie will be used for cross-site tracking).
 
 * `t_active` - this is a measure of time active on the site (with the tab open and focused).
