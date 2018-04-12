#! /usr/bin/env python
# -*- coding: utf-8 -*-


"""
Whotracks.me website development tool.

Usage:
    whotracksme website [serve]
    whotracksme data [list]
    whotracksme db (create|dump|check_urls)
    whotracksme -h | --help

Options:
    serve           Watch for changes and reload.
    -h, --help      Show help message.
"""


from pathlib import Path
import os
import sqlite3

import docopt

from whotracksme.website.builder import Builder
from whotracksme.website.serve import serve
from whotracksme.data.loader import load_tracker_db
from whotracksme.qa.todo import upgrade_to_https, create_task_files


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
            # TODO: Replace this with `pathlib`
            tracker_db_path = os.path.join(os.path.dirname(__file__), 'data', 'assets', 'trackerdb.sql')
            conn = sqlite3.connect('tracker.db')
            with open(tracker_db_path, 'w') as fp:
                for line in conn.iterdump():
                    fp.write('%s\n' % line)
        elif args.check_urls:
            needqa = Path('needqa')
            if not needqa.exists():
                needqa.mkdir()
            https_upgrade = upgrade_to_https(tracker_db='tracker.db')
            create_task_files(needqa_folder=needqa, **https_upgrade)


if __name__ == '__main__':
    main()
