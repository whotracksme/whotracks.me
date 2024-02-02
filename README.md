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
    <a href="https://whotracks.me/trackers.html" target="_blank" rel="noopener noreferrer">Trackers</a>
    · <a href="https://whotracks.me/websites.html" target="_blank" rel="noopener noreferrer">Websites</a>
    · <a href="https://whotracks.me/blog.html" target="_blank" rel="noopener noreferrer">Blog</a>
    · <a href="https://whotracks.me/explorer.html" target="_blank" rel="noopener noreferrer">Explorer</a>
  </em>
</p>

<p align="center">
  <a href="https://www.ghostery.com" target="_blank" rel="noopener noreferrer">
    <img alt="powered by Ghostery" src="https://img.shields.io/badge/ghostery-powered-blue?logo=ghostery&style=flat-square">
  </a>
  <a href="https://twitter.com/WhoTracks_me">
    <img alt="Follow WhoTracks.Me on Twitter" src="https://img.shields.io/twitter/follow/WhoTracks_me.svg?logo=twitter&label=WhoTracks.Me&style=flat-square"></a>
  <a href="https://github.com/cliqz-oss/adblocker/blob/master/LICENSE">
    <img alt="License Badge" src="https://img.shields.io/github/license/ghostery/whotracks.me?style=flat-square"></a>
</p>

---

This repository contains:

- data on trackers and websites as shown on [whotracks.me](https://whotracks.me/) (WTM)
- database mapping tracker domains to companies
- code to render the [whotracks.me](https://whotracks.me/) site

# Installation

Python 3.11 is needed to build the site. We recommend creating a
[virtualenv](http://docs.python-guide.org/en/latest/dev/virtualenvs/)
to install the dependencies, or use `pipenv` or )

to

```sh
python -m venv venv
. venv/bin/activate
```

After the initial setup, you can proceed with installing whotracks.me.

For nushell:

```nushell
python -m virtualenv venv
overlay use venv/bin/activate.nu
```

## With Pip

```sh
$ python -m pip install git+https://github.com/ghostery/whotracks.me.git
```

## From source

After cloning the repository:

```sh
$ python -m pip install -r requirements.txt
$ python -m pip install -e .
```

That’s all you need to get started\!

# Downloading the data

Each month, we release a new version of the web site. The raw data, from which the
graphs have been computed, are also available as an open data set (updated every month).

The data from month can be also directly [accessed through the website](https://whotracks.me/explorer.html).

More information on the raw data can be found in `whotracksme/data/Readme.md`.

# Using the data

To get started with the data, everything you need can be found in
`whotracksme.data`:

```python
from whotracksme.data.loader import DataSource

data = DataSource()

# available entities
data.trackers
data.companies
data.sites
```

A whitepaper for whotracks.me is available at https://arxiv.org/abs/1804.08959, and here's a BibTeX entry that you can use to cite it in a publication:

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

# Building the site

Building the site requires a few extra dependencies, not installed by
default to not make the installation heavier than it needs to be. You
will need to install `whotracksme` from the repository, because not all
assets are packaged with `whotracksme` released on pypi:

```sh
$ python -m pip install -r requirements-dev.txt
$ python -m pip install -e '.[dev]'
```

Once this is done, you will have access to a `whotracksme` entry point
that can be used this way:

```sh
$ whotracksme website [serve]
```

The `serve` part is optional and can be used while making changes on the
website.

All generated artifacts can be found in the `_site/` folder.

> If you debug the website generator, the parallel execution can be
> disabled by setting the environment variable DEBUG=1.

## Tests

To run tests, you will need `pytest`, or simply install `whotracksme`
with the `dev` extra:

```sh
$ python -m pip install -e '.[dev]'
$ pytest
```

# Contributing

We are happy to take contributions on:

- Guest articles for our blog in the topics of tracking, privacy and security. Feel free to use the data in this repository if you need inspiration.
- Feature requests that are doable using the WTM database.
- Curating our database of tracker profiles. Open an issue if you spot anything odd.

# Right to Amend

Please read our [Guideline for 3rd parties](https://github.com/ghostery/whotracks.me/blob/master/RIGHT_TO_AMEND.md) wanting to suggest
corrections to their data.

# License

The content of this project itself is licensed under the [Creative
Commons Attribution 4.0 license](https://creativecommons.org/licenses/by/4.0/), and the underlying source code used
to generate and display that content is licensed under the [MIT
license](https://github.com/ghostery/whotracks.me/blob/master/LICENSE.md).
