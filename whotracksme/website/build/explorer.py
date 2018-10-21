#!/usr/bin/env python
# -*- coding: utf-8 -*-

from pathlib import Path
import json
import shutil

from whotracksme.data.db import load_tracker_db, create_tracker_map
from whotracksme.data.pack import pack_rows
from whotracksme.website.utils import print_progress

# List all fields + define in which order they should be displayed
FIELDS = {
    field: rank
    for rank, field in enumerate(
        [
            "month",
            "country",
            "name",
            "tracker",
            "site",
            "company",
            "category",
            "site_proportion",
            "tracker_proportion",
            "site_rank",
            "tracker_rank",
            "popularity",
            "reach",
            "reach_rank",
            "bad_qs",
            "font",
            "beacon",
            "cookies",
            "content_length",
            "beacon",
            "has_blocking",
            "hosts",
            "https",
            "iframe",
            "image",
            "media",
            "plugin",
            "referer_leaked",
            "referer_leaked_header",
            "referer_leaked_url",
            "requests",
            "requests_failed",
            "requests_tracking",
            "script",
            "site_reach",
            "site_reach_rank",
            "stylesheet",
            "tracked",
            "trackers",
            "xhr",
            "company_id",
            "companies",
        ]
    )
}


def build_packed_data(data):
    data_dir = Path("_site/data/packed/")
    if not data_dir.exists():
        data_dir.mkdir(parents=True)

    for data_source in ["trackers", "companies", "sites", "sites_trackers"]:
        with open(f"_site/data/packed/{data_source}.pack", "wb") as output:
            output.write(
                b"".join(
                    pack_rows(fields=FIELDS, rows=getattr(data, data_source).get_snapshot().itertuples())
                )
            )

    print_progress(text="Generate packed data")


def build_explorer(data):
    build_packed_data(data)
    shutil.copyfile("explorer/index.html", "_site/explorer.html")
    shutil.copyfile("explorer/logic.js", "_site/explorer.js")
