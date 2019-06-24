title: Chrome's Manifest V3 - Improving Privacy?
subtitle: How Chrome's changes will reduce user privacy
author: privacy team
type: article
publish: True
date: 2019-06-18
tags: blog, extensions, privacy, chrome
header_img: blog/adblocker-perf-study.jpg
+++

The Chrome team's proposed changes to browser extension APIs, known as Manifest v3, have proven controversial due to their expected impact on adblockers and privacy extensions. Of particular concern are the changes to the `webRequest` API, whose blocking capabilities are being replaced by the `declarativeNetRequest` API. In repeated posts the Chrome team claim that these changes are required to improve the *performance*, *security* and *privacy* of extensions. In a [previous post](./adblockers_performance_study.html) we showed that, for the most popular adblocker engines, performance is already very good, and these changes are unlikely to improve much. In this post we assess the privacy argument for the changes to request handling, if the proposed changes do improve privacy, and how Ghostery specifically will be affected. We find that:

* The Chrome team have only belatedly stated specific privacy concerns with the `webRequest` API, and these are still not included in the design document.
* The proposed changes do not provide any protections against the stated privacy issues.
* Privacy extensions like Ghostery will be negatively impacted by the changes, reducing their ability to keep users safe online.

## Extension privacy

Browser extensions have the potential to cause many privacy problems - when granted permissions, they can see every page you visit in the browser, view their contents, read and write form data, and send requests to any server on the internet. These powers are required for some of the valuable features extensions provide. Therefore, as the Chrome team rightly [point out](https://blog.chromium.org/2019/05/taking-action-on-deceptive-installation.html), ensuring extensions are consentfully installed is the first step to address privacy.

The Manifest v3 changes, however, primarily address extensions' capabilities post install. As privacy at this point is also a stated goal, what are the privacy concerns and attacks that the changes seek to address? In the Manifest V3 [design document](https://docs.google.com/document/d/1nPu6Wy4LWR66EFLeYInl3NzzhHzc-qnk4w4PX-0XMw8/edit#heading=h.9lwe237fxtp2) this goal is stated as follows:

> Users should have increased control over their extensions.  A user should be able to determine what information is available to an extension, and be able to control that privilege.

Later in the document the changes to the `webRequest` API are described, but only using a performance-based reasoning:

> … the extension then performs arbitrary (and potentially very slow) JavaScript, and returns the result back to the browser process.  This can have a significant effect on every single network request, ...

They also acknowledge that the `webRequest` API should remain in place for observation.

> The non-blocking implementation of the webRequest API, which allows extensions to observe network requests, but not modify, redirect, or block them (and thus doesn't prevent Chrome from continuing to process the request) will not be discouraged.

This implies that the potential privacy impact of extensions being able to observe all requests going out of the browser are not a concern for these API changes. While the `webRequest` API remains, the switch to allow blocking only via the `declarativeNetRequest` API does nothing for the stated privacy goal of increasing user control over the information extensions can access.

Despite this, since [our study](./adblockers_performance_study.html) showed that the performance cost of `webRequest` blocking for leading adblockers was not an issue, the Chrome team have focused on privacy reasons for the changes. In their [recent blog](https://blog.chromium.org/2019/06/web-request-and-declarative-net-request.html) about web request and declarative net request changes, they state:

> In order to improve the security and privacy guarantees of the extensions platform, we are rethinking some of the extension platform's core APIs. That's why we're planning to replace the blocking Web Request API with the Declarative Net Request API.

This shift in angle has also come up in public statements by Chrome devs:

> "… The big problem with webRequest is unfixable privacy and security holes. …" @justinschuh ([Source](https://twitter.com/justinschuh/status/1134060703231254528))

In the blog post they also mention one potential malicious use of webRequest:

> Because all of the request data is exposed to the extension, it makes it very easy for a malicious developer to abuse that access to a user’s credentials, accounts, or personal information.

If this is the single privacy loophole the `webRequest` changes are targeting, then it seems strange that the solution is to remove the blocking capabilities of `webRequest` and leave the observational ones. Post Manifest V3, the exact same malicious extension will be possible. We can imagine that the Chrome team's strategy may be, that by providing a simple alternative API for blocking use-cases, the extension review process can be tougher for extensions asking for `webRequest` permissions. This, however, would also be possible by just introducing the new API, leaving `webRequest` as it is, and providing developer incentives to switch unless they really need `webRequest` for their use-case.

It is strange that this privacy issue was not stated in the original design document, and the proposed change to `webRequest` is seemingly just collateral damage that does not address the stated goals. More transparency is needed on what the strategy is here, and why keeping `webRequest` observation with blocking removed should be the solution.

To summarise:

- The stated privacy improvements of Manifest V3 are addressed elsewhere in the proposals.
- The privacy and security issues with `webRequest` blocking have not been fully articulated by the Chrome team, with only a brief mention of malicious behaviour in a blog post last month.
- The removal of `webRequest` blocking does not improve the privacy of extensions.

Therefore at this point, the primary impact on privacy from the proposed changes will be the neutering of the capabilities of several privacy extensions. Privacy Badger devs [expect their core functionality to be broken](https://github.com/EFForg/privacybadger/issues/2273) by the changes. Similarly, we expect it to be difficult to provide the same level of protection in Ghostery should these changes come into effect, and we will describe why in the rest of this post.

It is ironic that a change ostensibly aimed at improving user privacy will actually reduce it for many users who rely on privacy extensions to protect them online. Some have suggested that the changes simply align Chrome with Apple's Safari, which provides a similar declarative blocking API for extensions. This overlooks the fact that Safari comes with significant privacy protections by default, having been blocking most third-party cookies by default for years, and recently bringing in advanced anti-tracking measures in the form of [ITP](https://webkit.org/blog/8613/intelligent-tracking-prevention-2-1/). Chrome on the other hand, ships with zero tracking protection by default, and is now hindering extensions which try to provide comparible protections to other browsers.

## How removing webRequest blocking affects Ghostery

This analysis is based on the `declarativeNetRequest` [API documentation](https://developer.chrome.com/extensions/declarativeNetRequest) as of 17th June 2019. The primary features of the API are:

1. A matching grammar for specifying rules that will trigger blocking, header modification or redirects.
2. Up to 30,000 static rules per extension
3. The ability to add _dynamic_ rules at runtime, up to a maximum of 5,000 rules.
4. Rules can have a white- or black-list of first-party sites, to control triggering.
5. Individual sites can be dynamically whitelisted, up to a maximum of 100 per extension.

Ghostery contains the following components which will be affected by the webRequest API changes:

### 1. Tracker matching and blocking

Ghostery contains a blocklist of over 4,000 filters which are used to detect and block trackers. The extension allows users fine-grained control over these, allowing or blocking specific trackers on specific sites or globally. The list of detected trackers is shown in the Ghostery UI for each page visited.

To support the `declarativeNetRequest`, these 4,000 filters would have to be re-written to the new filter grammar that Chrome offers. We are likely to lose some filters in the process, as certain types of matching rule, for example Regex's likely cannot be implemented in the more restrictive grammar.

The more challenging issue, however, is maintaining Ghostery's rich configurability with the low threshold of dynamic rules allowed. As every rule should be toggleable, all 4,000 filters would have to be _dynamic_ rules. This means that we are already using 80% of our allowance from the start, before we have even started adding supplementary rules for adblocking and cookie blocking.

Likewise, the limit of 100 whitelisted sites is prohibitively low, as many users may us the Ghostery 'Trust Site' feature for more sites than this. It is unclear how to handle hitting this limit, as to the user it will seem like the feature is broken if they trust a site, but it does not get saved.

Furthermore, the new API, in it's current form, does not report the results of blocking back to the extension. This means that we will still have to run our filters on all urls via the `webRequest` API anyway, in order to display the list of trackers seen and blocked. This means that the user pays the cost of keeping the block list loaded in memory and matching against each url twice.

### 2. Cookie blocking

The Ghostery extension uses a heuristic third-party cookie blocker as part of the 'Enhanced Anti-Tracking' feature. This feature blocks third-party cookies in most cases, using a set of heuristics to decide when cookies should be allowed. It is currently not clear if these heuristics will be able to work correctly without the webRequest API, nor if the dynamic filter cap is sufficient to even hold the basic cookie blocklist.

Our cookie heuristics respond to user input, for example clicking on a Facebook like button or Google login form, in order to trigger a temporary cookie whitelist for a specific domain. To implement this with `declarativeNetRequest`, we would have to add or modify our cookie blocking rule temporarily. As the API for this is asynchronous, we introduce a race condition that we did not have before. If the rule is not added before the request we want to whitelist, the mechanism will fail. This can, for example, break Google logins on third-party sites.

The cookie blocking is done based on a dynamically generated list of tracker domains of between 2,000 and 3,000 entries. For these domains, third-party cookies should be blocked, unless a heuristic allows it. Again, the limited rule threshold of the `declarativeNetRequest` API means that this list would have to be reduced.

Another concern is that the [Rule condition specification](https://developer.chrome.com/extensions/declarativeNetRequest#type-Rule) can distuingiush between `firstParty` and `thirdParty` contexts for a request, but this is done on a frame level, rather than relative to the page document. This means that we would not, for example, be able to block Google cookies inside a Google Ads iFrame, as in this context the API would consider requests from the frame as first party.

### 3. Removing private data points

The other component of Ghostery's 'Enhanced Anti-Tracking' feature is the dynamic removal of url parameters seen to be used for cross-site tracking. This uses a [k-anonymity](./how_cliqz_antitracking_protects_users.html) based algorithm, using anonymously contributed data from our users.

As the `declarativeNetRequest` API does not support dynamic redirects, this component cannot be implemented with it.

### 4. Adblocker

Ghostery includes an additional adblocker component which is able to further block ads based on standard blocklist. As this feature should also be toggleable on-and-off at runtime, we would need to use _dynamic_ rules for these filters. With only 1,000 rules available after adding the Ghostery tracker matching, the coverage of this feature would be drastically reduced.

### 5. WhoTracks.Me Data

Ghostery is the primary source of data for this website, using our [anonymised telemetry system](https://arxiv.org/abs/1804.08959) to report on global tracker trends. This largely relies on the webRequest API in order to observe which trackers are on which page. Changes caused by the introduction of `declarativeNetRequest` will reduce the quality of this data. Namely, cookies blocked by the declarative API will not be visible to webRequest listeners. This means that we will not be able to distinguish between trackers setting cookies, which are then blocked, and those who do not set cookies.

### Summary

To summarise, the Manifest V3 changes to the webRequest API will require a significant re-write of the Ghostery extension to be able to fit the existing features into the constraints of the `declarativeNetRequest` API. The result will be:

- Slower: URL matching will have to be done twice in order to show tracker counts in the UI.
- Less configurable: Configuration may have to be limited to fit within the  very low dynamic rule limit.
- Break sites more often: We will have to evaluate the trade-offs of relaxing the third-party cookie blocking vs. breaking sites.
- Less private: As the private data removal feature will have to be removed.

## Conclusion

In this post we have shown that the current proposed changes to the webRequest API by Chrome do not improve privacy, and in fact reduce it, by severely hindering the operation of privacy extensions like Ghostery. The limitations on dynamic rules in the new `declarativeNetRequest` API are particularly taxing for extensions which aim to the give user control over what is blocked and what is not.
This forces extensions into a 'dumb blocker' model, where block lists are fixed, and the only controls are an on/off toggle. At the same time,
the changes increase the difficulty and practicality of implementing dynamic heuristic mechanisms for detecting and blocking tracking.

The webRequest API powers much innovation in browser extensions, however it does implicitly provide access to private user data. While the Chrome team state that privacy is a reason for the proposed changes to this API they have not stated which specific concerns they aim to address. The Manifest V3 changes do not prevent extensions accessing private user data via webRequest, nor have other potentially dangerous APIs like content scripts been limited. Therefore the claims that this change improves extension privacy are misleading and disingenuous.

The fact that very few of the initial concerns regarding Manifest V3 have been addressed in the months since the original announcement, means that it currently looks like the changes will be forced through, despite community objections. This means that Chrome users will become second class web citizens with regards to their access to tracking protection. This is however just a continuation of a trend where Chrome stands still or actively reduces privacy while the rest of the competition have been pushing forward. At this point we recommend considering switching away from Chrome, if you haven't done so already, to browsers with privacy built-in by default. For example, the [Cliqz Browser](https://cliqz.com/en/download) has Anti-tracking built in and enabled by default, and Firefox now ships with [tracking protection on by default](https://blog.mozilla.org/blog/2019/06/04/firefox-now-available-with-enhanced-tracking-protection-by-default/).

_Disclosure: WhoTracks.Me is a joint effort by Cliqz and Ghostery. Mozilla is an investor in Cliqz._
