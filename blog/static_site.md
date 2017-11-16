title: Building whotracks.me
subtitle: The journey of adding search, data, plots and blog to 1000+ pages of tracker profiles and top domains.
author: no one
type: article
publish: True
date: 2017-11-03
tags: tracker-free, lightweight
header_img: blog/blog-site.jpg
+++

At Cliqz and Ghostery, we [privately collect tracker data](/blog/where_is_the_data_from.html) 
to power our [anti-tracking](blog/how_cliqz_antitracking_protects_users.html) technology.
We see our anti-tracking as a community effort and as such we want to share a structured
representation of this data to cast some light on the tracker landscape.


Out of the three main entities involved on a page load: **users**, **websites** and **trackers**,
we have data only on the last two. We'll start with:

* Profiles of the [top 500 trackers](/trackers.html) 
* Tracker data on the [top 500 domains](/websites.html).


With these out of the way, a blog space woud also be needed. This for a couple
of reasons. We realised there was a need for a learning space where we 
explain concepts referred to in the site. Let's call these **primers**. 
These define what we call a [tracker](/blog/what_is_a_tracker.html),
what [cookies](/blog/cookies.html) and [fingerprinting](/blog/fingerprinting.html)
or [where this data comes from](/blog/where_is_the_data_from.html), and 
hopefully over time it will become a space for curious readers 
to be introduced to tracking technologies. The second reason is to have 
a space where we'll be writing about particular trackers, technologies, papers,
engineering, and other fun stuff.



## Going static

Through whotracks.me, we want to cast some light on the tracking 
landscape, but also make a point about trackers and **privacy by design**, 
hence the choice of this being a static site was pretty obvious. This 
meant that we could build the whole site offline, put it in a folder 
and serve it through CDN.

Given this will be updated a few times a month, build performance was not really 
a big issue for us. But stumbling upon [a discussion](https://news.ycombinator.com/item?id=15507538) 
about site generators' performance, some comments read: 

- *"with Hugo + Pygments was taking ~20s for ~20 pages at the time"*
- *"92 pages in 1s (full rebuild, No CSS magic tooling though)"*
- *"Rust: ~10k pages in ~60s"*

The assumption would be that most of this time is spent parsing the 
markdown files. To build this site however, with the exception of the
blog, the rest of the pages are mainly about instantiating a template,
plugging some content, and writing to disk. So most likely a comparison between 
site generators and this would be unfair. At the time this is written, 
whotracks.me has roughly 1020 pages.  On 1000 of these pages there are 
offline generated plots, quite some data and a fair amount of tooling 
with respect to styling.  On a `Thinkpad x230` with an Intel `i3 processor`: 


```bash
(venv) ➜  whotracks.me git:(master) ✗ time python build.py site
Home page ............................... done
Tracker list ............................ done
Website list ............................ done
Blog List ............................... done
Blog Posts .............................. done
Website pages ........................... done
Tracker Pages ........................... done
python build.py site  13.86s user 1.08s system 158% cpu 9.400 total
```

This will be a 5 part series dedicated to:

1. [Generating a static site (part 1)](/blog/static_site_generation.html)
2. [Visualization (part 2)](/blog/static_site_visualization.html)
3. [Building a blog (part 3)](/blog/static_site_blog.html)
4. Search, for some definition of search.
5. No third party trackers and Fast

The code and data to generate this site is open on github at
[`https://github.com/cliqz-oss/whotracks.me`](https://github.com/cliqz-oss/whotracks.me).

<br><br>

So let's start with [Generating a Static Site (part 1) ... ](/blog/static_site_templating.html)
