# Local development

## Building the website (the static HTML based version) and the internal API

The code to build the website on https://www.ghostery.com/whotracksme is not public;
but for local testing, you can still use the code for the [previous version](https://web.archive.org/web/20240501140903/https://whotracks.me/).

Python 3.13 is recommended to build the site:

```sh
python3.13 -m venv venv
. venv/bin/activate
pip install -r requirements-dev.txt
pip install -e '.[dev]'
```

If you have not done so, make sure that you have downloaded data (see [Data Readme](../whotracksme/data/Readme.md)).

```
whotracksme website
```

It will generate static HTML files in the `_site` directory. Plus, it will also create a JSON files
in the `_site/api/` directory. Use them at your own risk, since the format is expected to change over
time. If there is interest to stabilize the API files, let us know. Currently, it is only used internally
within Ghostery to power the new website.

> Hint: if you debug the website generator, the parallel execution can be
> disabled by setting the environment variable DEBUG=1.

## Tests

To run the unit tests:

```sh
python3.13 -m venv venv
. venv/bin/activate
python -m pip install -e '.[dev]'
pytest
```
