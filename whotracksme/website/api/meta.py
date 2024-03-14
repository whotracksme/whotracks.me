import os
from datetime import datetime, timezone
import json
import re

def get_trackerdb_version():
    trackerdb_sql = 'whotracksme/data/assets/trackerdb.sql'
    with open(trackerdb_sql, 'r') as f:
        header = f.readline()
        match = re.search(r'-- Generated from https:[/][/]github.com[/]ghostery[/]trackerdb[/]releases[/]download[/](\d+)[/]trackerdb[.]db', header)
        if not match:
            raise ValueError(f'Failed to parse TRACKERDB_VERSION from file {trackerdb_sql}')
        return match.group(1)


TRACKERDB_VERSION = get_trackerdb_version()


def get_api_meta_data(trackerdb_version,
                      ts=datetime.now(timezone.utc).isoformat()):
    return {
        "trackerdb": {
            "version": trackerdb_version,
            "release": f"https://github.com/ghostery/trackerdb/releases/tag/{trackerdb_version}",
            "file": {
                "json": f"https://github.com/ghostery/trackerdb/releases/download/{trackerdb_version}/trackerdb.json",
                "db": f"https://github.com/ghostery/trackerdb/releases/download/{trackerdb_version}/trackerdb.db",
                "engine": f"https://github.com/ghostery/trackerdb/releases/download/{trackerdb_version}/trackerdb.engine"
            }
        },
        "updatedAt": ts
    }


def update_api_meta_data():
    meta_data = get_api_meta_data(trackerdb_version=TRACKERDB_VERSION)

    target = '_site/api/v2/meta.json'
    os.makedirs(os.path.dirname(target), exist_ok=True)
    with open(target, 'w', encoding='utf-8') as out:
        json.dump(meta_data, out, indent=2)
