title: Government websites
subtitle: If you are not the product, you're the taxpayer
author: privacy team
type: article
publish: True
date: 2018-10-10
tags: trackers, government
header_img: blog/gov_trackers/gov.png
redirect_url: https://www.ghostery.com/blog/government-websites-trackers
+++


_This post is one of our regular monthly blogs accompanying an update to the data
displayed on WhoTracks.Me. In these posts we introduce what data has been added as
well as point out interesting trends and case-studies we found in the last month._

<br />

On WhoTracks.me we typically profile websites where we see presence of tracking.
One new category of site we observed loading trackers this month was government websites.
Government websites act as information portals, allowing citizens to access information
or services from their government. In some cases the use of government sites will be
mandatory, for example services set up for submitting tax or visa information.
Thus, it is concerning that we see third-party tracking appearing on these sites, where
users do not have a choice whether or not they access the service, and are then forced
to hand over data to third-party companies by their governments.

![Average number of third parties per Country](../static/img/blog/gov_trackers/average_per_country.svg)
<p class="img-caption">Average number of trackers seen on selected government websites from
the WhoTracks.Me September dataset.</p>

Here's a list of the government websites ending up in this month's release:
<table class="table table-hover">
  <thead>
    <tr>
      <th>Country</th>
      <th>Site</th>
      <th>Notable trackers</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Australia</td>
      <td><a href="../websites/bom.gov.au.html">bom.gov.au</a> </td>
      <td>
        <a href="../trackers/google_analytics.html">Google Analytics</a>,
        <a href="../trackers/doubleclick.html">Doubleclick</a>
      </td>
    </tr>
    <tr>
      <td>Europe</td>
      <td><a href="../websites/europa.eu.html">europa.eu</a></td>
      <td>
        <a href="../trackers/google_analytics.html">Google Analytics</a>,
        <a href="../trackers/google.html">Google</a>,
        <a href="../trackers/twitter.html">Twitter</a>
      </td>
    </tr>
    <tr>
      <td>France</td>
      <td><a href="../websites/ants.gouv.fr.html">ants.gouv.fr</a></td>
      <td>
        <a href="../trackers/google_analytics.html">Google Analytics</a>,
        <a href="../trackers/doubleclick.html">Doubleclick</a>
      </td>
    </tr>
    <tr>
      <td>France</td>
      <td><a href="../websites/legifrance.gouv.fr.html">legifrance.gouv.fr</a></td>
      <td>
        <a href="../trackers/at_internet.html">AT Internet</a>
      </td>
    </tr>
    <tr>
      <td>France</td>
      <td><a href="../websites/impots.gouv.fr.html">impots.gouv.fr</a></td>
      <td>
        <a href="../trackers/at_internet.html">AT Internet</a>
      </td>
    </tr>
    <tr>
      <td>Russia</td>
      <td><a href="../websites/zakupki.gov.ru.html">zakupki.gov.ru</a></td>
      <td>
        <a href="../trackers/yandex.html">Yandex</a>
      </td>
    </tr>
    <tr>
      <td>UK</td>
      <td><a href="../websites/tax.service.gov.uk.html">tax.service.gov.uk</a></td>
      <td>
        <a href="../trackers/google_analytics.html">Google Analytics</a>,
        <a href="../trackers/optimizely.html">Optimizely</a>
      </td>
    </tr>
    <tr>
      <td>US</td>
      <td><a href="../websites/ca.gov.html">ca.gov</a></td>
      <td>
        <a href="../trackers/google_analytics.html">Google Analytics</a>,
        <a href="../trackers/google.html">Google</a>,
        <a href="../trackers/addthis.html">AddThis</a>
      </td>
    </tr>
    <tr>
      <td>US</td>
      <td><a href="../websites/dhs.gov.html">dhs.gov</a></td>
      <td>
        <a href="../trackers/google_analytics.html">Google Analytics</a>,
        <a href="../trackers/doubleclick.html">Doubleclick</a>
      </td>
    </tr>
    <tr>
      <td>US</td>
      <td><a href="../websites/irs.gov.html">irs.gov</a></td>
      <td>
        <a href="../trackers/google_analytics.html">Google Analytics</a>,
        <a href="../trackers/new_relic.html">New Relic</a>,
        <a href="../trackers/lockerz_share.html">AddToAny</a>,
        <a href="../trackers/youtube.html">Youtube</a>,
        <a href="../trackers/foresee.html">Foresee</a>
      </td>
    </tr>
    <tr>
      <td>US</td>
      <td><a href="../websites/nih.gov.html">nih.gov</a></td>
      <td>
        <a href="../trackers/google_analytics.html">Google Analytics</a>,
        <a href="../trackers/doubleclick.html">Doubleclick</a>,
        <a href="../trackers/google.html">Google</a>
      </td>
    </tr>
    <tr>
      <td>US</td>
      <td><a href="../websites/noaa.gov.html">noaa.gov</a></td>
      <td>
        <a href="../trackers/google_analytics.html">Google Analytics</a>
      </td>
    </tr>
    <tr>
      <td>US</td>
      <td><a href="../websites/state.gov.html">state.gov</a></td>
      <td>
        <a href="../trackers/google_analytics.html">Google Analytics</a>,
        <a href="../trackers/google.html">Google</a>,
        <a href="../trackers/youtube.html">Youtube</a>,
        <a href="../trackers/qualtrics.html">Qualtrics</a>
      </td>
    </tr>
    <tr>
      <td>US</td>
      <td><a href="../websites/weather.gov.html">weather.gov</a></td>
      <td>
        <a href="../trackers/google_analytics.html">Google Analytics</a>,
        <a href="../trackers/addthis.html">AddThis</a>
      </td>
    </tr>
  </tbody>
</table>

It also surprised us that Germany (where the majority of our contributors reside)
does not appear. A brief check of a few sites like
<a target="_blank" rel="noreferrer" href="https://bundestag.de">bundestag.de</a> and the
<a target="_blank" rel="noreferrer" href="https://bzst.de">Federal Tax Office</a> shows a preference for self-hosted analytics,
such as Matomo, rather than third-party solutions.

Note that, as we do not collect data about pages with no third-party trackers, the data we show here may be biased for sites where sensitive areas do not have tracking. Further study would be required to access whether the tracking reported here leaks sensitive information when accessing public services. However, the presence of tracking on these pages is enough to leak valuable metadata about citizens to third-party companies. We should be asking if it is acceptable for our governments to expose us to this risk...
