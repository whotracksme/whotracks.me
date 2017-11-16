title: Where does the data come from?
subtitle: An explanation of the origin of the data in this site, and why its collection is private.
author: privacy team
type: primer
publish: True
date: 2017-07-22
tags: data, tracking
header_img: blog/blog-data2.jpg
+++

We take privacy very seriously. Over the course of the last 
two years, we have been building a set of privacy-tools, 
including a state-of-the-art [anti-tracking technology](https://static.cliqz.com/wp-content/uploads/2016/07/Cliqz-Studie-Tracking-the-Trackers.pdf)
that uses an algorithmic, data-driven approach to remove 
unique identifiers (UIDs) from third party requests, which 
we found to perform better than the traditional blocklist 
approach, maximising protection while minimizing site breakage. 
You can read more about it in 
['How does Cliqz Anti-tracking work'](/blog/how_cliqz_antitracking_protects_users.html).

We block hundreds of millions of cookies and remove 
tens of millions of UIDs per day. This has given us important 
insights on the tracker landscape.


**The data presented in this site** is collected by the Cliqz browser 
and extension for Firefox. We receive a message for each page 
loaded in the browser (except in private tabs), which describes 
the third-party requests required to load that page. We take the 
following steps to ensure that this data is anonymised:

- The address of the page is split into hostname and path, and 
these are both obfuscated with a truncated hash. This means 
that only well know hostnames and paths can be revealed by us, 
and private pages will remain undecipherable.
- Third parties are aggregated at the subdomain level, all 
paths are removed, and we just send counters of signals. 
For example we would send the number of requests which 
had a cookie header for a domain.
- Each page load is send as an independent message, and via 
our proxy network. This prevents us from linking page loads 
back together at the server side by looking at the 
IP address of the sender, for example.
 
The data collected was audited by external researchers 
in April 2017. Some theoretical attacks to link messages 
were found which affected a small subset of messages. 
These issues were subsequently fixed to remove this 
attack vector. For example, we no longer collect the paths 
of the third-party requests, as on some sites specific 
resources (such as avatars) will only be loaded for a 
specific logged in user. This resource could then be 
tracked across page loads to build a partial user history 
for this particular site.
 
This data is primarily used to automatically generate 
the list of tracking domains which Cliqz anti-tracking 
will work on. The side-effect is that this data can 
also be used to generate this census of trackers across the web.