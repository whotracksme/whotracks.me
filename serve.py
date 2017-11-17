#! /usr/bin/env python
# -*- coding: utf-8 -*-
"""
Serves _site using http.server

Usage:
    serve
    serve -h | --help

Options:
    -h, --help                   Show help message.
"""

from docopt import docopt
from subprocess import run


if __name__ == '__main__':
    args = docopt(__doc__)
    run(["python", "-m", "http.server"], cwd="_site")
