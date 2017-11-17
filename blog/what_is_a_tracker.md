title: What is a tracker?
subtitle: Explaining what makes a particular domain a  tracker 
author: privacy team
type: primer
publish: True
date: 2017-07-22
tags: primer, tracking
header_img: blog/blog-trackers.jpg
+++


A tracker is a company which collects information about you as you browse the web. Their scripts and [tracking pixels](/blog/tracking_pixel.html) are inserted into the websites you visit by publishers or advertising networks, usually in exchange for some service that the tracking company provides. Trackers usually use some kind of user identifier in order to link information about you from different sites, in order to build up a profile, based on your browsing history.

We define a tracker as a third-party domain which is:

- present on multiple (`> 10`) different websites with a significant combined traffic
- uses [cookies](/blog/cookies.html) or [fingerprinting](/blog/fingerprinting.html) methods in order to transmit user identifiers
 

Why do trackers exist?
===

The majority of the companies behind trackers offer services to website publishers. The publishers will put scripts or [tracking pixels](/blog/tracking_pixel.html) for these services onto their sites. There are many different use-cases for these services, such as:

- Analytics: used to measure how many people are visiting the site, where from etc. e.g. Google Analytics.
- Advertising: provide advertising on site in order to monetise visits. e.g. DoubleClick, Outbrain.
- Advertising (conversion tracking): advertising trackers can also appear on site without ads. This is usually to measure conversions, or to improve the targeting of the publishers ads elsewhere on the web.
- Social Media: Integration with social networks. e.g. Facebook like button.
- Content Delivery Networks (CDN): Networks which provide high bandwidth content like videos and images. e.g. Youtube, Cloudflare.
- Comments: Embedded comment systems allow users to comment on articles. e.g. Disqus
- Customer interaction: Live chat and support widgets. e.g. LivePerson.
 
Many of these use-cases do not require tracking, but may do so by accident because the implementation is easier, or on purpose because the data generated can be used to increase revenue.
 
What's the problem with tracking?
===

As trackers use user identifiers to group data received from each unique user, and browsers send the url of the first-party page to third-party resources in the page [as standard](https://en.wikipedia.org/wiki/HTTP_referer), trackers are effectively able to collect a subset of users' browsing history. Even if this history is linked to an 'anonymous' identifier, any browsing history of reasonable length can be [deanonymised](http://randomwalker.info/publications/browsing-history-deanonymization.pdf) to [find the user](https://www.slideshare.net/jmpujol/data-collection-without-privacy-sideeffects-at-big2016-www-2016#20) behind it.

Furthermore, in the majority of cases, trackers are invisible on the pages they appear. There is little or no transparency about who is logging activity on a site, hence the need for tools such as [Ghostery](https://www.ghostery.com/) to call them out.
