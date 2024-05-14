&nbsp;

<p align="center">
  <img src="https://raw.githubusercontent.com/ghostery/whotracks.me/master/static/img/who-tracksme-logo.png" width="300px" alt="WhoTracks.Me" />
</p>
<h3 align="center">Bringing Transparency to Online Tracking</h3>

<p align="center">
  <em>
    Transparency
    · Privacy
    · Tracking landscape
    · Built by Ghostery
  </em>
  <br />
  <em>
    <a href="https://www.ghostery.com/whotracksme/trackers" target="_blank" rel="noopener noreferrer">Trackers</a>
    · <a href="https://www.ghostery.com/whotracksme/websites" target="_blank" rel="noopener noreferrer">Websites</a>
    · <a href="https://www.ghostery.com/whotracksme/explorer" target="_blank" rel="noopener noreferrer">Explorer</a>
  </em>
</p>

<p align="center">
  <a href="https://www.ghostery.com" target="_blank" rel="noopener noreferrer">
    <img alt="powered by Ghostery" src="https://img.shields.io/badge/ghostery-powered-blue?logo=ghostery&style=flat-square">
  </a>
  <a href="https://github.com/cliqz-oss/adblocker/blob/master/LICENSE">
    <img alt="License Badge" src="https://img.shields.io/github/license/ghostery/whotracks.me?style=flat-square"></a>
</p>

# Downloading the data

Each month, we release a new version of the web site. The data from the last month can be directly [accessed through the website](https://www.ghostery.com/whotracksme/explorer).

The raw data, from which the graphs have been computed, is also available as an open data set (updated every month). You can also
download historical data. More information on the raw data can be found [here](whotracksme/data/Readme.md).

WhoTracks.me also builts heavily on another open source project called [TrackerDB](https://github.com/ghostery/trackerdb);
all meta data (e.g. company descriptions) is maintained there.

# Using the data

You can directly use the [raw data](whotracksme/data/Readme.md), which are all text files. As an alternative, you an also
download it locally and use the Python API:

```
python3.11 -m venv venv
. venv/bin/activate
pip install git+https://github.com/ghostery/whotracks.me.git
```

... or if you have locally checked it out:

```
python3.11 -m venv venv
. venv/bin/activate
pip install -r requirements.txt
```

The Python API can now be accessed as follows (make sure you have already downloaded data):

```python
from whotracksme.data.loader import DataSource

data = DataSource()

# available entities
data.trackers
data.companies
data.sites
```

A whitepaper for WhoTracks.me is available at https://arxiv.org/abs/1804.08959, and here's a BibTeX entry that you can use to cite it in a publication:

```
@misc{whotracksme,
    title={WhoTracks.Me: Shedding light on the opaque world of online tracking},
    author={Arjaldo Karaj and Sam Macbeth and Rémi Berson and Josep M. Pujol},
    year={2018},
    eprint={1804.08959},
    archivePrefix={arXiv},
    primaryClass={cs.CY}
}
```

# Contributing

We rely on contributions for the community to keep the quality of this project high. If you want, you can support us in multiple ways:
* Do you see inconsistencies in the data? Please open a Github issue [here](https://github.com/whotracksme/whotracks.me/issues). We will have a look!
* Do you see wrong company descriptions? Did we put something in the category? Please check out the [TrackerDB project](https://github.com/ghostery/trackerdb), where all the meta data is kept, and open an [issue](https://github.com/ghostery/trackerdb/issues), or send us a pull request.
* Do you have any feedback on the [WhoTracks.me homepage](https://www.ghostery.com/whotracksme) or about the documentation? Please, let us know, so we can improve.

You can also contact us via email at [info@whotracks.me](mailto:info@whotracks.me)

# Right to Amend

Please read our [Guideline for 3rd parties](https://github.com/ghostery/whotracks.me/blob/master/RIGHT_TO_AMEND.md) wanting to suggest
corrections to their data.

# Local builds

[Readme on local builds](docs/local-build.md) (this is mostly relevant for the maintainer of this project)

# License

The content of this project itself is licensed under the [Creative
Commons Attribution 4.0 license](https://creativecommons.org/licenses/by/4.0/), and the underlying source code used
to generate and display that content is licensed under the [MIT
license](https://github.com/ghostery/whotracks.me/blob/master/LICENSE.md).
