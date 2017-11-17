title: Fingerprinting
subtitle: Let me tell you what's unique about your device. 
author: privacy team
type: primer
publish: True
date: 2017-07-22
tags: primer, tracking
header_img: blog/blog-fingerprinting.jpg
+++

A device fingerprint or machine fingerprint or browser fingerprint is information collected about a remote computing device for the purpose of identification. Fingerprints can be used to fully or partially identify individual users or devices even when [cookies](/blog/cookies.html) are turned off.

Basic web browser configuration information has long been collected by web analytics services in an effort to accurately measure real human web traffic and discount various forms of click fraud. With the assistance of client-side scripting languages, collection of much more esoteric parameters is possible [[1](http://browserspy.dk/)]. Assimilation of such information into a single string comprises a device fingerprint. In 2010, EFF measured at least 18.1 bits of entropy possible from browser fingerprinting, [[2](https://panopticlick.eff.org/static/browser-uniqueness.pdf)] but that was before the advancements of canvas fingerprinting, which claims to add another 5.7 bits.

Prior to early 2017, device fingerprinting was limited to single browsers. If a user switched browsers regularly, fingerprinting could not be used to link the user to these browsers [_citation needed_]. A cross browser fingerprinting method has been published [[3](http://yinzhicao.org/TrackingFree/crossbrowsertracking_NDSS17.pdf)] which allows tracking of a user across multiple browsers on the same device.


The excerpt above has been retrieved from [wikipedia](https://en.wikipedia.org/wiki/Device_fingerprint).


## References

[1] [Browser Spy](http://browserspy.dk/) <br>
[2] EFF: [How Unique Is Your Web Browser?](https://panopticlick.eff.org/static/browser-uniqueness.pdf) <br>
[3] [(Cross-)Browser Fingerprinting via OS and Hardware Level Features](http://yinzhicao.org/TrackingFree/crossbrowsertracking_NDSS17.pdf) <br>
[4] Source: [Wikipedia](https://en.wikipedia.org/wiki/Device_fingerprint)
