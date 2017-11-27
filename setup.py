from setuptools import setup, find_packages
from os import path

HERE = path.abspath(path.dirname(__file__))


LONG_DESCRIPTION = ''
with open(path.join(HERE, 'README.md')) as readme_file:
    LONG_DESCRIPTION = readme_file.read()

setup(
    name='whotrackme',
    version='2017.11',
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
    keywords='tracking whotracksme whotracks.me',
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
    ],
    extras_require={
        'website': [
            'colour',
            'jinja2',
            'markdown',
            'plotly',
            'sanic',
            'squarify',
            'watchdog',
        ],
        'test': [
            'pytest',
        ],
    },
    package_data={
        'whotracksme': [
            'data/assets/*.json',
            'data/assets/*.sql',
        ],
    },
    include_package_data=True,
    zip_safe=False,
    entry_points={
        'console_scripts': [
            'whotracksme=whotracksme.main:main',
        ],
    },
)
