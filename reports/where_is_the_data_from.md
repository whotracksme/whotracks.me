title: Where does the data come from?
subtitle: An explanation of the origin of the data in this site, and why it's collection is private.
author: Privacy Knight
type: primer
publish: True
date: 2017-07-22
tags: data, tracking
header: blog/blog-data2.jpg
+++

The data is collected by the Cliqz browser and extension for Firefox. We receive a message for each page loaded in the browser (except in private tabs), which describes the third-party requests required to load that page. We take the following steps to ensure that this data is anonymised:

- The address of the page is split into hostname and path, and these are both obfuscated with a truncated hash. This means that only well know hostnames and paths can be revealed by us, and private pages will remain undecipherable.
- Third parties are aggregated at the subdomain level, all paths are removed, and we just send counters of signals. For example we would send the number of requests which had a cookie header for a domain.
- Each page load is send as an independent message, and via our proxy network. This prevents us from linking page loads back together at the server side by looking at the IP address of the sender, for example.
 
The data collected was audited by external researchers in April 2017. Some theoretical attacks to link messages were found which affected a small subset of messages. These issues were subsequently fixed to remove this attack vector. For example, we no longer collect the paths of the third-party requests, as on some sites specific resources (such as avatars) will only be loaded for a specific logged in user. This resource could then be tracked across page loads to build a partial user history for this particular site.
 
This data is primarily used to automatically generate the list of tracking domains which Cliqz anti-tracking will work on. The side-effect is that this data can also be used to generate this census of trackers across the web.