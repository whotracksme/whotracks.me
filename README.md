&nbsp;
<p align="center">
  <img src="https://raw.githubusercontent.com/cliqz-oss/whotracks.me/master/static/img/who-tracksme-logo.png" width="300px" alt="WhoTracks.Me" />
</p>
<h3 align="center">Bringing Transparency to Online Tracking</h3>

<p align="center">
  <em>
    Transparency
    · Privacy
    · Tracking landscape
    · Built by Cliqz & Ghostery
  </em>
  <br />
  <em>
    <a href="https://whotracks.me/trackers.html" target="_blank" rel="noopener noreferrer">Trackers</a>
    · <a href="https://whotracks.me/websites.html" target="_blank" rel="noopener noreferrer">Websites</a>
    · <a href="https://whotracks.me/blog.html" target="_blank" rel="noopener noreferrer">Blog</a>
    · <a href="https://whotracks.me/explorer.html" target="_blank" rel="noopener noreferrer">Explorer</a>
  </em>
</p>


<p align="center">
  <a href="https://cliqz.com" target="_blank" rel="noopener noreferrer">
    <img alt="powered by Cliqz" src="https://img.shields.io/badge/cliqz-powered-blue?logo=cliqz&style=flat-square">
  </a>
  <a href="https://twitter.com/WhoTracks_me">
    <img alt="Follow WhoTracks.Me on Twitter" src="https://img.shields.io/twitter/follow/WhoTracks_me.svg?logo=twitter&label=WhoTracks.Me&style=flat-square"></a>
  <a href="https://github.com/cliqz-oss/adblocker/blob/master/LICENSE">
    <img alt="License Badge" src="https://img.shields.io/github/license/cliqz-oss/whotracks.me?style=flat-square"></a>
</p>


-----

This repository contains:

  - data on trackers and websites as shown on [whotracks.me](https://whotracks.me/) (WTM)
  - database mapping tracker domains to companies
  - code to render the [whotracks.me](https://whotracks.me/) site

# Installation

Python 3.6 is needed to build the site. We recommend creating a
[virtualenv](http://docs.python-guide.org/en/latest/dev/virtualenvs/) (or `pipenv`) to install the dependencies.

## From Pypi

``` sh
$ pip install whotracksme
```

## From source

``` sh
$ pip install -r requirements.txt
$ pip install -e .
```

That’s all you need to get started\!

# Using the data

To get started with the data, everything you need can be found in
`whotracksme.data`:

``` python
from whotracksme.data.loader import DataSource

data = DataSource()

# available entities
data.trackers
data.companies
data.sites
```

# Building the site

Building the site requires a few extra dependencies, not installed by
default to not make the installation heavier than it needs to be. You
will need to install `whotracksme` from the repository, because not all
assets are packaged with `whotracksme` released on pypi:

``` sh
$ pip install -r requirements-dev.txt
$ pip install -e '.[dev]'
```

Once this is done, you will have access to a `whotracksme` entry point
that can be used this way:

``` sh
$ whotracksme website [serve]
```

The `serve` part is optional and can be used while making changes on the
website.

All generated artifacts can be found in the `_site/` folder.

## Tests

To run tests, you will need `pytest`, or simply install `whotacksme`
with the `dev` extra:

``` sh
$ pip install -e '.[dev]'
$ pytest
```

# Publishing a new version

``` sh
$ pip install twine
$ python setup.py sdist bdist_wheel
$ twine upload --username cliqz-oss dist/*
```

# Contributing

We are happy to take contributions on:

  - Guest articles for our blog in the topics of tracking, privacy and security. Feel free to use the data in this repository if you need inspiration.
  - Feature requests that are doable using the WTM database.
  - Curating our database of tracker profiles. Open an issue if you spot anything odd.

# Right to Amend

Please read our [Guideline for 3rd parties](https://github.com/cliqz-oss/whotracks.me/blob/master/RIGHT_TO_AMEND.md) wanting to suggest
corrections to their data.

# License

The content of this project itself is licensed under the [Creative
Commons Attribution 4.0 license](https://creativecommons.org/licenses/by/4.0/), and the underlying source code used
to generate and display that content is licensed under the [MIT
license](https://github.com/cliqz-oss/whotracks.me/blob/master/LICENSE.md).
