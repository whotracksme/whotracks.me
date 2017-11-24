#! /usr/bin/env python
# -*- coding: utf-8 -*-


"""
Whotracks.me website development tool.

Usage:
    whotracksme website [serve]
    whotracksme data [list]
    whotracksme -h | --help

Options:
    serve           Watch for changes and reload.
    -h, --help      Show help message.
"""


import docopt
from whotracksme.website.builder import Builder
from whotracksme.website.serve import serve


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


if __name__ == '__main__':
    main()
