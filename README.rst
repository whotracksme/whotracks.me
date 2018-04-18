
.. image:: https://raw.githubusercontent.com/cliqz-oss/whotracks.me/master/static/img/who-tracksme-logo.png
    :width: 200px
    :alt: whotracks.me
    :target: https://whotracks.me

Bringing Transparency to online tracking - built by Cliqz and Ghostery.

-----------------------------------------------------------------------

This repository contains:

-  data on trackers and websites as shown on `whotracks.me`_ (WTM)
-  database mapping tracker domains to companies
-  code to render the `whotracks.me`_ site

Installation
============

Python 3.6 is needed to build the site. We recommend creating a
`virtualenv`_ (or ``pipenv``) to install the dependencies.

From Pypi
---------

.. code:: sh

    $ pip install whotracksme

From source
-----------

.. code:: sh

    $ pip install -e .

That’s all you need to get started!

Using the data
==============

To get started with the data, everything you need can be found in
``whotracksme.data``:

.. code:: python

    from whotracksme.data.loader import DataSource

    data = DataSource()

    # available entities
    data.trackers
    data.companies
    data.sites

For examples of scripts, have a look in the `contrib`_ folder!

Building the site
=================

Building the site requires a few extra dependencies, not installed by
default to not make the installation heavier than it needs to be. You
will need to install ``whotracksme`` from the repository, because not
all assets are packaged with ``whotracksme`` released on pypi:

.. code:: sh

    $ pip install -e '.[dev]'

Once this is done, you will have access to a ``whotracksme`` entry point
that can be used this way:

.. code:: sh

    $ whotracksme website [serve]

The ``serve`` part is optional and can be used while making changes on
the website.

All generated artifacts can be found in the ``_site/`` folder.

Tests
-----

To run tests, you will need ``pytest``, or simply install ``whotacksme``
with the ``dev`` extra:

.. code:: sh

    $ pip install -e '.[dev]'
    $ pytest

Publishing a new version
========================

.. code:: sh

    $ pip install twine
    $ python setup.py sdist bdist_wheel
    $ twine upload --username cliqz-oss dist/*

Contributing
============

We are happy to take contributions on: \* Guest articles for our blog in
the topics of tracking, privacy and security. Feel free to use the data
in this repository if you need inspiration. \* Feature requests that are
doable using the WTM database. \* Curating our database of tracker
profiles. Open an issue if you spot anything odd.

Right to Amend
==============

Please read our `Guideline for 3rd parties`_ wanting to suggest
corrections to their data.

License
=======

The content of this project itself is licensed under the `Creative
Commons Attribution 4.0 license`_, and the underlying source code used
to generate and display that content is licensed under the `MIT
license`_.

.. _whotracks.me: https://whotracks.me
.. _virtualenv: http://docs.python-guide.org/en/latest/dev/virtualenvs/
.. _contrib: ./contrib
.. _Guideline for 3rd parties: https://github.com/cliqz-oss/whotracks.me/blob/master/RIGHT_TO_AMEND.md
.. _Creative Commons Attribution 4.0 license: https://creativecommons.org/licenses/by/4.0/
.. _MIT license: https://github.com/cliqz-oss/whotracks.me/blob/master/LICENSE.md
