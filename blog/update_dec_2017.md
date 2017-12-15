title: WhoTracks.me December Update
subtitle: New data and trackers in our monthly update.
author: privacy team
type: article
publish: True
date: 2017-12-08
tags: blog, update
header_img: blog/blog-data-nov17.jpg
+++

We're happy update the site today with data from November 2017 - based on data from 100 million page loads. We're also expanding the amount of data we show, up to 600 top websites and 600 top trackers.

## New Trackers in the database

Increasing the number of trackers displayed meant that we needed to add company information for a new batch of tracker domains, as well as new entrants appearing in the top 500. Some interesting new entrants:

 * [Tru Optik](https://whotracks.me/trackers/truoptik.html), a company offering targeted advertising for Smart TVs, and claiming 70 Million US households in their 'Household Graph'. Their presence across major Germany sites suggests they might be using online ad networks in order to harvest user information and link it to active Smart TVs, where they can then push targeted adverts.
 * [Digitrust](https://whotracks.me/trackers/digitrust.html), a non-profit aiming to reducing the number of third-party requests per page. Their solution, however, is to create a unified user identifier, intending to prevent the need for trackers to synchronise pixels and tracking tokens on each page. Notably, they state that they [do not support](http://www.digitru.st/faqs/) the [Do Not Track](https://en.wikipedia.org/wiki/Do_Not_Track) standard, so their claims to be working in consumers interests are, at best, suspect.
 * [ORC International](https://whotracks.me/trackers/orc_international.html), the registered owner of the domain `emxdgt.com`, and a subsiduary of [Engine](http://www.enginegroup.com/), an Advertising Agency. Despite only appearing in our data recently, they have quickly rised to the top 300 trackers, and are listed in the [ads.txt](https://iabtechlab.com/ads-txt/) files as a reseller for several major US publications, such as [The Atlantic](https://www.theatlantic.com/ads.txt) and [CNET](https://www.cnet.com/ads.txt). Their ownership, and policy for the data collection is, however, not transparently disclosed.

## Month-to-month trends

The average number of trackers on top websites increased by 3%, to 10.0. heine.de, gutefrage.net, sportscheck.com and bild.de increased their number of trackers the most, each of them added on average 5 more trackers page page load. At the other end of the spectrum, paket.de, jackpot.de and hurriyet.com.tr had on average 5 fewer trackers per page.

On the tracker side, the biggest gain was by pmddby.com, which increased its reach by 9 times since October. Its profile is that of Spyware which is injecting ads into webpages for affected users, however at this time we were not able to determine the source - the WHOIS data for the domain is private.

## Additions to the dataset

This month we added two new signals to the data which attempt to show the effect of ad- and tracker-blockers on the trackers in our database. These signals are:

 * `has_blocking` - the proportion of pages on which this tracker was affected by some kind of blocking.
 * `requests_failed` - the average number of failed requests per page load (for comparison with `requests` to get an idea of how aggressive the blocking is).

These signals should be able to tell us something about the impact of blocking on different trackers in the ecosystem. For example, we see evidence of blocking 40% of the time for Google Analytics and Facebook, and between 10% and 20% of requests failing. Thus, anyone using these services to measure activity and conversions on their sites must reckon with error rates in these orders.

We also can see how new entrants can initially avoid the effects of blocking - for Tru Optik and Digitrust who we mentioned earlier, we measure only 5 and 1% of pages which may be affected by blocking.

These stats are currently only available in the raw data, but we will be looking at incorporating them in the site in due course.
