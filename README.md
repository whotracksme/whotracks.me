

<img
alt="whotracks.me"
style="width: 200px"
src="https://raw.githubusercontent.com/cliqz-oss/whotracks.me/master/static/img/who-tracksme-logo.png">

Bringing Transparency to online tracking - built by Cliqz and Ghostery

___

This repository contains:

* data on trackers and websites as shown on [whotracks.me](https://whotracks.me) (`./data`)
* database mapping tracker domains to companies (`./db`)
* code to render the [whotracks.me](https://whotracks.me) site


## Installation

Python 3.x is needed to build the site. We recommend creating a
[virtualenv](https://docs.python.org/3/library/venv.html) to install the
dependencies.

```bash
$ virtualenv -p <path to python 3> <name>
```

### Using the data

```sh
$ pip install whotracksme
```

## Building the site

```sh
$ pip install -e '.[website,dev]'
```

Furthermore you also need to [install sass](http://sass-lang.com/install)

TODO
inst ruby-dev
```sh
$ gem install sass --user-install
```

```

```
. Watch for local changes and rebuild only what changed

All generated artifacts can be found in the `_site/` folder.

## Developing

```sh
$ pip install -e '.[dev,test]'
```

## Testing

## 2. Contributing

We are happy to take contributions on:
* guest articles for our blog in the topics of tracking, privacy and security. Feel free to use the data in this repository if you need inspiration.
* Curating our database of tracker profiles.


## 3. License

The content of this project itself is licensed under the [Creative Commons Attribution 4.0 license](https://creativecommons.org/licenses/by/4.0/), and the underlying
source code used to generate and display that content is licensed under the [MIT license](https://github.com/cliqz-oss/whotracks.me/blob/master/LICENSE.md).
