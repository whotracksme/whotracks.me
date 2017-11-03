title: Building whotracks.me
subtitle: The journey of adding search, data, plots and blog to 1000+ pages of tracker profiles and top domains.
author: no one
type: article
publish: True
date: 2017-11-02
tags: tracker-free, lightweight
header_img: blog/blog-site.jpg
+++

At Cliqz and Ghostery, we [privately collect tracker data](/blog/where_is_the_data_from.html) 
to power our [anti-tracking](blog/how_cliqz_antitracking_protects_users.html) technology.
We see our anti-tracking as a community effort and as such we want to share a structured
representation of this data to cast some light on the tracker landscape.
We are releasing data on the profiles of the [top 500 trackers](/trackers.html) 
and the companies that own them, and [top 500 domains](/websites.html).

We quickly realised there was a need for a learning space where we 
explain concepts referred to in the site. This series of primers define 
what we call a [tracker](/blog/what_is_a_tracker.html),
what [cookies](/blog/cookies.html) and [fingerprinting](blog/fingerprinting.html) 
are and hopefully over time it will become a space for curious readers 
to be introduced to tracking technologies. Then we'd also have a blog 
where we'd be writing about particular trackers, technologies and papers 
and other fun stuff.



https://news.ycombinator.com/item?id=15507538

> with Hugo + Pygments was taking ~20s for ~20 pages at the time
> I'm a Gopher! just did it to get my feet wet in Hs) --- 92 pages in 1s (full rebuild; No CSS magic tooling though
> Rust: ~10k pages in ~60s






Finally, with this site we wanted to also send a message that conveys 
our engineering modus operandi:

> Privacy By Design

In building this site, this meant that we could build the whole site offline, 
put it in a folder and serve it through CDN. To build it, we had to 
think of the following:

1. [Generating a static site (part 1)](/blog/tracker_free_site.html) - this article.
2. Data and Visualization centric
3. Search, for some definition of search.
4. No third party trackers
5. Fast

The code and data to generate this site is open on github at
[https://github.com/cliqz-oss/whotracks.me](`https://github.com/cliqz-oss/whotracks.me`).


So let's start with [Generating a Static Site](/blog/static_site_templating.html):
