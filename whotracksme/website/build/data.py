import json
from pathlib import Path
from whotracksme.data.loader import DataSource
from whotracksme.data.db import load_tracker_db, create_tracker_map
from whotracksme.website.utils import print_progress

def build_tracker_db():
    with open('_site/data/trackerdb.json', 'w') as output:
        db_map = create_tracker_map(load_tracker_db(), with_iab_vendors=False)
        db_map['about'] = 'WhoTracks.Me tracker database: whotracks.me'
        json.dump(db_map, output, indent=2, sort_keys=True)
    print_progress(text='Generate tracker DB')

def build_tracker_json(tracker_id, data):
    stats = data.trackers.get_tracker(tracker_id)
    stats['overview'] = dict(stats['overview'])
    # drop some columns
    for col in ['companies', 'month', 'trackers', 'tracker', 'id', 'company_id', 'category', 'country', 'site_reach', 'category_id']:
        del stats['overview'][col]
    stats['date_range'] = [date.strftime('%Y-%m') for date in stats['date_range']]
    stats['reach_time_series'] = data.trackers.get_reach(tracker_id)
    stats['reach_time_series']['ts'] = [month.strftime('%Y-%m') for month in stats['reach_time_series']['ts']]
    stats['presence_by_category'] = data.trackers.get_presence_by_site_category(tracker_id)
    # print(stats)
    with open(f'_site/data/trackers/global/{tracker_id}.json', 'w') as output:
        json.dump(stats, output)

    gh_id = stats['ghostery_id']

    if isinstance(gh_id, str):
        if gh_id.isdigit():
            stats['tracking_method'] = data.trackers.get_tracking_methods(tracker_id)
            with open(f'_site/data/trackers/ghostery/{gh_id}.json', 'w') as output:
                json.dump(stats, output)

def build_api(data):
    # tracker overviews
    data_dir = Path('_site/data/trackers/global')
    gh_data_dir = Path('_site/data/trackers/ghostery')

    data_dir.mkdir(parents=True, exist_ok=True)
    gh_data_dir.mkdir(parents=True, exist_ok=True)

    for id, stats in data.trackers.iter():
        build_tracker_json(id, data)

    print_progress(text='Generate API data')

def build_tracker_api_batch(batch):
    with DataSource(populate=False) as data:
        gh_data_dir = Path('_site/data/trackers/ghostery')
        gh_data_dir.mkdir(parents=True, exist_ok=True)

        for tracker_id in batch:
            build_tracker_json(tracker_id, data)

def build_website_api_batch(batch):
    with DataSource(populate=False) as data:
        for website in batch:
            stats = data.sites.get_datapoint(website)
            with open(f'_site/data/sites/global/{website}.json', 'w') as output:
                json.dump(stats._asdict(), output)
