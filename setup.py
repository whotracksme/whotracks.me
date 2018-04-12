#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import pathlib

from setuptools import setup, find_packages


PKGNAME = 'whotracksme'


LONG_DESCRIPTION = ''
with pathlib.Path('README.md').open() as readme_file:
    LONG_DESCRIPTION = readme_file.read()


# List all resources under whotracksme/data/
assets = []
DATA_DIR = pathlib.Path('whotracksme/data')
for root, dirs, files in os.walk(DATA_DIR):
    assets.extend(
        pathlib.Path(root, f).relative_to(DATA_DIR)
        for f in files
        if f.endswith('.csv') or f.endswith('.sql')
    )


setup(
    name=PKGNAME,
    version='2018.3',
    description='Learn about tracking technologies, market structure and data-sharing on the web',
    long_description=LONG_DESCRIPTION,
    classifiers=[
        'Development Status :: 4 - Beta',
        'Environment :: Console',
        'Intended Audience :: Developers',
        'Intended Audience :: Information Technology',
        'Intended Audience :: Science/Research',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
        'Programming Language :: Python :: 3.6',
        'Topic :: Internet',
        'Topic :: Scientific/Engineering :: Information Analysis',
    ],
    keywords='tracking whotracksme whotracks.me who tracks',
    url='https://whotracks.me',
    author='Cliqz Gmbh',
    author_email='privacy@cliqz.com',
    license='MIT',
    packages=find_packages(exclude=[
        '_site',
        'blog',
        'contrib',
        'data',
        'static',
        'templates',
        'tests',
    ]),
    install_requires=[
        'docopt',
        'pandas'
    ],
    extras_require={
        'dev': [
            'aiohttp',
            'colour',
            'jinja2',
            'markdown',
            'plotly',
            'pytest',
            'sanic',
            'squarify',
            'watchdog',
        ],
    },
    package_data={
        f'{PKGNAME}.data': assets,
    },
    zip_safe=True,
    entry_points={
        'console_scripts': [
            f'{PKGNAME}={PKGNAME}.main:main',
        ],
    },
)
