title: Improving Cookie Consent
subtitle: Cliqz' new feature to make consent fairer
author: privacy team
type: blog
publish: True
date: 2019-11-01
tags: blog, gdpr, consent
header_img: blog/blog-third-party-cookies.jpg
+++

Since the GDPR came into force in May last year, the Cookie-Consent Popup has become a fixture of browsing the web. These popups are ostensibly there to allow you to choose whether you agree or disagree to your data being used for certain purposes on the site, but confusing UI design and tricks mean that many users are not able to select their desired consent settings. A recent [study](https://arxiv.org/pdf/1909.02638.pdf) showed that user fatigue with consent popups, and simple UI tricks are able to artificially inflate the opt-in rate. The study also showed that, when opt-out is the default, only 0.1% of users would consent to all data processing. This is in stark contrast to the over 90% opt-in rate that the [industry claims](https://www.thedrum.com/news/2018/07/31/over-90-users-consent-gdpr-requests-says-quantcast-after-enabling-1bn-them), and uses to justify that users are OK with tracking.

How can we restore balance to this situation, and allow users a fair choice about how their data is used? At Cliqz we have been developing a new feature to aim to address the difficulty of denying consent based around 3 core principles:

1. Opt-out and opt-in should both require maximum of one click, i.e. the time-cost should be the same, no matter which choice is made.
2. The user should not have to decide individually for every site. Their default choice can be used to give consent after their initial decision.
3. Consent banners only offering an 'OK' or 'Allow' option do not allow user choice. The are at best a distraction for the user, and at worst drive consent fatigue and encourage the bad practice of automatically clicking away message prompts. These should be hidden.

Unfortunately, implementing an automated consent choice in the browser is made challenging by the lack of adoption or adherence to browser standards. The [Do Not Track](https://www.w3.org/blog/2018/06/do-not-track-and-the-gdpr/) standard enables users to broadcast preferences around tracking, and for sites to communicate tracking status to the browser. Before that, the [P3P Project](https://www.w3.org/P3P/) attempted to standardise privacy practices and allow automated decision making around them. Both of these standards have been rejected by the tracking industry, who prefer to present consent on their terms. The industry have instead proposed and implemented the [Transparency and Consent Framework](https://iabeurope.eu/transparency-consent-framework/), which primarily focuses on communicating consent between vendors. It is a read-only API, so the browser can only read the consent status as set by the site, and not modify it. This means that consent can currently only be expressed by clicking through HTML forms.

<img class="img-responsive" src="../static/img/blog/autoconsent/cookie-blocker-before.gif" alt="Navigating a Cookie-Consent Popup manually" />
<p class="img-caption">Navigating a Cookie-Consent Popup manually.</p>

Luckily, the number of vendors offering consent solutions is limited, and browser extensions can simulate clicking through forms. Thus, [autoconsent](https://github.com/cliqz-oss/autoconsent) was born - a library of rules standardising the navigation of consent forms for the most popular sites and vendors. This library is able to:

* Detect the presence of supported Consent Management Providers on a page.
* Determine whether a popup or overlay is being shown on the page.
* Execute an opt-in (allow all purposes) or opt-out (reject all purposes).
* Where available, re-open the popup to allow modification of the settings.

In practice, this allows consent popups to be rapidly dismissed when loading a new site. The speed depends on the provider and how quickly their UI can be manipulated. In all cases, however, this is faster than a user could navigate the interface.

<img class="img-responsive" src="../static/img/blog/autoconsent/cookie-blocker-after.gif" alt="Automatic navigation of the Cookie-Consent Popup" />
<p class="img-caption">Automatic navigation of the Cookie-Consent Popup.</p>

For popups that are informational only, or force affirmative consent, we apply simple cosmetic rules. These are CSS rules that define elements in the page that should be hidden. As with the consent rules, we benefit from the defacto standardisation of tools for displaying of popups, such that a small number of rules can support the majority of popups shown by websites.

These elements combined mean that we now just have to ask the user once whether they want to opt-in or opt-out, then they will not be bothered by consent popups on the majority of sites they visit. At the same time, they will signal to these sites their approval or dissapproval of their data collection practices. 

This signal of non-consent is important to encourage and incentivise a shift in data usage practices on the web. When sites realise they cannot just trick users into allowing invasive data collection, they will have a strong incentive to change the way they operate and respect users more.

The new Cliqz Cookie-Popup blocker is available in the latest version of the Cliqz browser. Get it at [cliqz.com](https://cliqz.com/download).