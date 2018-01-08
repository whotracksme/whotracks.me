title: WhoTracks.me January Update
subtitle: New data and trackers in our monthly update.
author: privacy team
type: article
publish: True
date: 2018-01-08
tags: blog, update
header_img: blog/blog-data-jan18.png
+++

We've updated the site today with data collected during December 2017. This month, like [last month](./update_dec_2017.html), we have collected tracking data from around 100 million new page loads.

## New trackers

There were again several new entrants into the top 600 trackers list. Here are some interesting ones:

- [Amazon Cloudfront](../trackers/amazon_cloudfront.html): We decided to split the 'Amazon Web Services' (AWS) tracker into two constituent parts: [Cloudfront](../trackers/amazon_cloudfront.html), their CDN offering, and [Amazon Web Services](../trackers/amazon_web_services.html) with the remaining domain names used by AWS. Both of these services place highly in our rankings, at 14th and 16th respectively. These services are commonly used to host content on pages, both by the site owners and by third-party trackers. However, in these cases the default `cloudfront.net` and `amazonaws.com` domains are being used, which makes it difficult to attribute the entities behind these requests as they are hiding behind domains registered to Amazon. AWS makes it easy to serve Cloudfront and other AWS services from other domain names, a practice which should improves transparency around whose content is being loading into pages.
- [Sourcepoint](../trackers/sourcepoint.html): An increasing number of services are appearing aimed at recapturing the ad-blocking audience. Sourcepoint appears at 184th in our ranking doing just this: quantifying ad-blocker usage on publisher sites, trying to convert these users to subscription models, or giving a choice of different ad-supported models. Several German publishers seem to have started to use this service, detected via their `summerhamster.com` domain, including [chip.de](../websites/chip.de.html) and [faz.net](../websites/faz.net.html).
- [Admachine](../trackers/admachine.html): This is a [Real-time bidding](https://en.wikipedia.org/wiki/Real-time_bidding) platform that we primarily see on the [imagetwist.com](../websites/imagetwist.com.html) image hosting website. We detected this tracker via the `adx1.com` domain. However, tracing this domain back to the service which it is part of was non-trivial: The domain itself is registered to a company called 'Platform Inc.'. With such a generic company name, we were not able to find a home page for this company. However, continued searching for the `adx1.com` domain yielded [documentation for admachine](http://docs.admachine.co/article/69-xml-feed-implementation-reference) which instructs developers to use an API on this domain.  Furthermore the page has a copyright notice for [Platform.IO](https://platform.io/) who in turn has `© 2017 Platform Inc.` on their page. The need for this kind of investigation is common when trying to match tracker domains to companies and services, and the transparency of tracker ownership in general is a major issue.

## Month-to-month trends

The average number of trackers on top websites remained largely constant from November to December 2017, at 10. The largest increase in number of trackers for a site was by [spox.com](../websites/spox.com.html) with 8 more on average than last month. [Freenet.de](../websites/freenet.de.html) and [rakuten.de](../websites/rakuten.de.html) also registered increases of 7 and 6 respectively. [01net.com](../websites/01net.com.html) and [dailymail.co.uk](../websites/dailymail.co.uk.html) registered the largest decreases in trackers, but both started from very high bases of over 20 trackers per page.