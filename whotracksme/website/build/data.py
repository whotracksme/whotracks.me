import json
from whotracksme.data.db import load_tracker_db, create_tracker_map

def build_tracker_db():
    with open('_site/data/trackerdb.json', 'w') as output:
        db_map = create_tracker_map(load_tracker_db(), with_iab_vendors=True)
        db_map['about'] = 'WhoTracks.Me tracker database: whotracks.me'
        json.dump(db_map, output, indent=2, sort_keys=True)
