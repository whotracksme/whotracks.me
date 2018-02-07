#! /usr/bin/env python
# -*- coding: utf-8 -*-


"""
Whotracks.me website development tool.

Usage:
    whotracksme website [serve]
    whotracksme data [list]
    whotracksme db (create|dump)
    whotracksme -h | --help

Options:
    serve           Watch for changes and reload.
    -h, --help      Show help message.
"""


import docopt
import os
import sqlite3
from whotracksme.website.builder import Builder
from whotracksme.website.serve import serve
from whotracksme.data.loader import load_tracker_db


class objectview:
    """Allows to access keys of a dictionary as attributes.

    Example:
        >>> view = objectview({ 'foo': True, 'bar': False })
        >>> view.foo
        True
        >>> view.bar
        False
    """
    def __init__(self, d):
        self.__dict__ = d


def website(args):
    builder = Builder()
    builder.build()

    if args.serve:
        serve(builder)


def main():
    args = objectview(docopt.docopt(__doc__))
    if args.website:
        website(args)
    elif args.data:
        # TODO - allow basic exploration of the data
        pass
    elif args.db:
        if args.create:
            load_tracker_db(loc='tracker.db')
        elif args.dump:
            tracker_db_path = os.path.join(os.path.dirname(__file__), 'data', 'assets', 'trackerdb.sql')
            conn = sqlite3.connect('tracker.db')
            with open(tracker_db_path, 'w') as fp:
                for line in conn.iterdump():
                    fp.write('%s\n' % line)


if __name__ == '__main__':
    main()
