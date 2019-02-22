title: Changing Site Reach
subtitle: Making metrics that make more sense.
author: privacy team
type: article
publish: True
date: 2019-02-15
tags: blog, update,
header_img:
+++

This month we updated the site with data from over 800 million page loads during January. In this
data release we have also made a change to one of the main figures that we publish - site reach.
These changes aim to make this stat more understandable, and more representative of reality. In
this post we describe this change and why we have made it.

The site reach stat was conceived as a measure of how many different sites a tracker has some
presence. In contrast to reach - the proportion of pages loading a tracker - it shows how spread
around the web a tracker is. The ratio between the two can describe the deployment of a tracker:

- High reach and high site reach - Ubiquitous presence across both popular and less popular sites;
- High reach and low site reach - Present primarily on popular, high-traffic sites;
- Low reach and high site reach - Only appearing rarely on many sites, e.g. only on a small number
of pages for each site;
- Low reach and low site reach - Present on few lower-traffic sites.

Up until this point, we have defined site reach as the proportion of sites for which a given
tracker was observed a fixed number of times. Using this formula we have run into two fundemental
issues in practice:

 1. Defining when a tracker is present on a site.

    The simplest solution would be to say that one observation is sufficient. However, noise is
    introduced browser configurations can result in extra trackers appearing sites via browser
    extensions or ISP redirects. Other sources of noise mean that a low threshold makes the metric
    vulnerable to fluctuations from changes in data-volume. The end result is that if this threshold
    is too low then the metric is unstable, flutunating when no real-world change has occurred.

 2. The long-tail of low traffic sites skew the results.

    Looking at the traffic to different sites in our dataset in January, after filtering, we observe
    1.3 million different sites. However traffic distribution is very biased to the top few thousand
    sites. Looking at the `popularity` metric for sites, which measures the relative about of traffic
    compared to the most popular site (Google.com), already the 10th most popular site (Pornhub) has
    just 6% of Google's traffic. By the 100th place, this ratio is 0.6%, and 1000th place this is 0.08%.
    By the time we are at the 100,000th entry there are only 430 page loads over a month, and at place
    1,000,000 just 16. This long tail means that, firstly, the impact of tracker presence on these
    sites is low - the bottom 50% of the 1.3 million sites we see only corresponds to 1% of total
    traffic - and secondly, the low data volume increases the noise involved in measuring presence.

Due to these difficulties and subsequently explaining the various thresholds set to counter these
effects, we decided to redesign the metric to make it simpler, but still measure the prevalance of
sites using the tracker.

Given that the top 10,000 sites account for 75% of page loads in our data, we decided to measure
the presence across this fixed set of sites. By fixing the denominator of our formula the output
is no longer influenced by the number of sites observed, which can vary with data volume. This
metric is also simpler - a ratio over 10,000 is easier for most people to understand, than over
1.3 million. For example, we now show a site reach of [13 sites](../trackers/realperson.de.html)
instead of 0.006% previously.

We define a new site reach metric as:

> The number of sites in the top 10,000 which have this tracker on more than 1% of page loads.

As of now the data is updated to use this new metric, under the `site_reach_top10k` key. A further
 value, `site_avg_frequency` gives the mean presence across these sites.

How does this metric compare to the previous one? We back-calculated the new metric for the last
5 months, and found this makes the site reach for some of the top trackers even more concerning:

- [Google Analytics](../trackers/google_analytics.html) went from being present on 70% of all
websites to 8,871 of the top 10k, and there are only 539 sites in the top 10k which _don't_ use
[Google Fonts](../trackers/google_fonts.html) on any page.
- Of the top 1000 trackers on WhoTracks.Me, only 47 are on over 1,000 sites, and 331 over 100
sites. This shows just how dominated the tracking landscape by a few trackers monopolising user data.
- The mean site reach for the top 1,000 trackers has been increasing over the last 5 months, from
210 sites last September, to 255 in January.

This new metric is now present on the WhoTracks.Me website in place of the old metric, and published
in our [data](https://github.com/cliqz-oss/whotracks.me/tree/master/whotracksme/data). As usual we
 will continue publishing monthly updates to track the development of this metric over time.