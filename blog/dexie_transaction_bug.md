title: A quantum bug in Firefox Quantum
subtitle: DevTools - how we tracked down an observant-dependent bug.
author: privacy team
type: article
publish: True
date: 2019-04-30
tags: blog
header_img: blog/dexie_transaction_bug/release.png
+++

Summary: _When observing your own program can change its behavior, and an unexpected but real use-case to detect if DevTools are open._

---

Occasionally one comes along weird bugs, some might even call them mystic or heisenbugs. We recently stumbled upon one such bug while working on the [Cliqz Extension](https://cliqz.com/en/).

It started with a rather innocent warning in our browser console. While testing an upcoming release, we noticed some warnings emitted from the [Dexie.js](https://dexie.org/) library, which is a popular wrapper for IndexedDB, a browser database API:

    Unhandled rejection: r@moz-extension://a4671cfd-e7e2-4264-9f96-b21f9b289cd9/modules/vendor/dexie.min.js:1:25586
    _promise/i<@moz-extension://a4671cfd-e7e2-4264-9f96-b21f9b289cd9/modules/vendor/dexie.min.js:2:1746
    U@moz-extension://a4671cfd-e7e2-4264-9f96-b21f9b289cd9/modules/vendor/dexie.min.js:1:6115
    q@moz-extension://a4671cfd-e7e2-4264-9f96-b21f9b289cd9/modules/vendor/dexie.min.js:1:5934
    _promise@moz-extension://a4671cfd-e7e2-4264-9f96-b21f9b289cd9/modules/vendor/dexie.min.js:2:1720
    _trans@moz-extension://a4671cfd-e7e2-4264-9f96-b21f9b289cd9/modules/vendor/dexie.min.js:1:25312
    _idbstore@moz-extension://a4671cfd-e7e2-4264-9f96-b21f9b289cd9/modules/vendor/dexie.min.js:1:25632
    get@moz-extension://a4671cfd-e7e2-4264-9f96-b21f9b289cd9/modules/vendor/dexie.min.js:1:25747
    getTag/<@moz-extension://a4671cfd-e7e2-4264-9f96-b21f9b289cd9/modules/webextension-specific/app.bundle.js:15679:35
    …

At first, it did not look too serious, but after digging in a bit more, it turned out that core functionalities of both the Cliqz and [Ghostery extensions](https://www.ghostery.com/) were negatively impacted. Each time the extension attempted to aggregate some statistics for display on our FreshTab page, the operation would mysteriously fail. And this is how the investigation started...

We quickly noticed that the bug could neither be reproduced on the [Cliqz Browser](https://cliqz.com/en/) nor on Firefox 66 (which is at this time the stable release). Only Firefox 67 (developer edition) and Firefox 68 (Nightly) were affected. Further testing confirmed that the issue could be reproduced with previous versions of the Cliqz and Ghostery extensions (which share part of the code base). At this point we suspected a bug in Dexie or IndexedDB and started looking deeper.

We realized that whenever a Dexie operation was attempted as part of a transaction, the operation would fail, a warning would be displayed, and the transaction would abort. With that insight, we were able to create a first workaround by avoiding the use of transactions. Still, it was not clear why the code would fail on Firefox 67 and simply avoiding transactions without understanding the root cause was not satisfactory. For this reason, we tried to narrow it down further. A first attempt to reproduce the problem with a minimal extension and the same type of transactions was not successful. All database operations succeeded normally; the issue seemed to happen only as part of the Cliqz extension.

Then we started trimming down our bundle by removing code from the Cliqz extension, step by step. We had the feeling that it had to be a kind of timing issue, but it was not clear which conditions were necessary or sufficient to trigger the bug. It took us time to realize, but finally we had the Eureka moment! It only seemed that the transactions would fail when DevTools were opened! This was literally a heisenbug, only triggering when observed in the console. Not opening the console would be enough to make the code work as expected. In other words, if the code ran fast enough that we did not have time to open the debugger, everything would work perfectly.

It was a race condition indeed, but not in the traditional sense of the term, rather it was a race between the developer and the code...

With that understanding, we were able to create a minimal example and could file proper bug reports for both Firefox and Dexie.js:

* [Bug 1545400 - Webextension console dev-tools opened makes IndexedDB/Dexie transaction fail](https://bugzilla.mozilla.org/show_bug.cgi?id=1545400)
* [Dexie #831 - Transaction fails if console dev-tools opened (Firefox 67)](https://github.com/dfahlander/Dexie.js/issues/831)

Detecting whether DevTools are open
===

Let us take a closer look at how this bug can be used to run code only when DevTools are opened. Ideally, a browser should not allow that, although it is difficult to prevent it in practice. Some discussion on that topic can be found in [this Chromium issue](https://bugs.chromium.org/p/chromium/issues/detail?id=672625). This has been exploited in the past by some websites to hide malicious behavior from the eyes of developers or users; whenever DevTools would be opened, the site would conceal some of the logic immediately, preventing inspection.

Most existing techniques to detect DevTools are leveraging browser bugs, which eventually got patched (examples can be found [here](https://stackoverflow.com/q/7798748/783510) and [here](https://github.com/sindresorhus/devtools-detect/issues/15)). Typically, they use quirks in various Browser APIs, but there are also solutions based on timing attacks.

Another approach is to look at the window size, which is currently used in the [devtools-detect library](https://github.com/sindresorhus/devtools-detect). The drawback is that it can be easily bypassed if the DevTools are opened in a separate window.

Using the transaction bug, we can build a DevTools detector for Firefox 67 and above that will also work for undocked windows. Here is a sketch of the idea:

    function onDevToolsOpen() {…}
    function onDevToolsClosed() {…}

    const db = new Dexie('test_db');
    db.version(1).stores({ test_table: 'test_key' });

    setInterval(() => {
      // uses the bug that the Dexie transaction will fail
      // with open DevTools in Firefox 67 and above
      db.transaction('rw', db.test_table, async () => {
        await db.test_table.toArray()
      }).then(onDevToolsOpen, onDevToolsClosed);
    }, 1000);

If you want to try yourself, a working example is available [here](https://cdn.cliqz.com/browser-f/fun-demo/firefox_devtools.html).

Until a patch for the bug gets released, the technique will work in pages and as well as in web extensions. In the [bug ticket](https://bugzilla.mozilla.org/show_bug.cgi?id=1545400), we also included a working example that detects DevTools from within a WebExtension.

This issue joins an array of techniques which enable malicious actors to detect special states of the browser, such as private browsing mode, and when users are [auditing the activities of sites with DevTools](https://github.com/gorhill/uBO-Extra#purpose). The former has been used to [deny access to sites in private browsing mode](https://arstechnica.com/information-technology/2017/05/boston-globe-website-no-longer-lets-you-read-articles-in-private-mode/), attempting to force users to reduce their protection against tracking, while the latter is used by [systems which circumvent adblocker to cover their tracks](https://www.theregister.co.uk/2017/08/11/ad_blocker_bypass_code/).
