"""
Helper script to update the trackers-preview.json file.

The raw input data (aka "privacy score") is computed each month but is
internal to the processing pipeline. This scripts downloads the data,
slightly converts it to allow us to publish it.

Usage:
    update_tracker_preview [INPUT]

Args:
FILE: optional local filename (by default, the data is loaded from S3)
"""

# To run the unit tests:
# $ python -m doctest -v update_trackers_preview.py


import os
from docopt import docopt
import boto3
import re
import io
import json

def download_privacy_score(bucket_name, bucket_prefix):
    """
    Find the latest month, download it and return its content as a dictionary.
    """
    s3_client = boto3.client('s3')
    s3_client.get_paginator('list_objects_v2')
    input_matcher = re.compile(f'^{bucket_prefix}2[0-9][0-9][0-9]-[0-9][0-9][.]json$')

    def iterate_bucket(s3_client, bucket_name, bucket_prefix, input_matcher):
        pageinator = s3_client.get_paginator('list_objects_v2')

        for page in pageinator.paginate(Bucket=bucket_name, Prefix=bucket_prefix):
            if page['KeyCount'] == 0:
                continue

            for item in page['Contents']:
                if input_matcher.match(item['Key']):
                    yield item['Key']

    latest_key = max(iterate_bucket(s3_client, bucket_name, bucket_prefix, input_matcher))
    print(f'Downloading latest_key file s3://{bucket_name}/{latest_key} ...')
    return json.loads(s3_client.get_object(Bucket=bucket_name, Key=latest_key)['Body'].read())

def list_known_categories(privacy_score):
    categories = set()
    for xs in (list(val['categories'].keys()) for val in privacy_score.values()):
        categories.update(xs)
    return categories

def generate_trackers_preview(privacy_score):
    """
    Generates a trackers_preview representation.

    >>> generate_trackers_preview(dict()) == { "categories": [], "trackers": {} }
    True

    >>> generate_trackers_preview({
    ...  "google.com": {
    ...     "site": "google.com",
    ...     "some_random_key_to_be_ignored": "...",
    ...     "categories": {
    ...       "cdn": 5,
    ...       "audio_video_player": 1,
    ...       "site_analytics": 1,
    ...       "advertising": 2,
    ...       "extensions": 1,
    ...       "essential": 1,
    ...       "misc": 1,
    ...       "social_media": 1
    ...     }
    ...   },
    ...   "youtube.com": {
    ...     "site": "youtube.com",
    ...     "some_other_key_to_be_ignored": "...",
    ...     "categories": {
    ...       "audio_video_player": 1,
    ...       "cdn": 5,
    ...       "advertising": 3,
    ...       "site_analytics": 2,
    ...       "social_media": 1,
    ...       "extensions": 1,
    ...       "essential": 1
    ...     }
    ...   }
    ... }) == {
    ...   "categories": ["advertising", "audio_video_player", "cdn", "essential", "extensions", "misc", "site_analytics", "social_media"],
    ...   "trackers": {
    ...     "google.com": [2, 1, 5, 1, 1, 1, 1, 1],
    ...     "youtube.com": [3, 1, 5, 1, 1, 0, 2, 1]
    ...   }
    ... }
    True

    """
    sorted_categories = sorted(list_known_categories(privacy_score))
    trackers = dict()
    for entry in privacy_score.values():
        trackers[entry['site']] = [entry['categories'].get(cat, 0) for cat in sorted_categories]
    return { 'trackers': trackers, 'categories': sorted_categories }

def write_json(data, path):
    with open(path, 'w') as f:
        f.write(json.dumps(data, separators=(',', ':')))
    print(f'Successfully generated file: {path}')

if __name__ == "__main__":
    args = docopt(__doc__)
    local_file = args['INPUT']
    if local_file:
        print(f'Loading local file: {local_file} ...')
        privacy_score = json.loads(open(local_file, mode='r').read())
    else:
        bucket_name = 'ghostery-antitracking-data'
        bucket_prefix = 'privacy-score/site/'
        privacy_score = download_privacy_score(bucket_name, bucket_prefix)

    trackers_preview = generate_trackers_preview(privacy_score)
    write_json(trackers_preview, 'whotracksme/data/assets/trackers-preview.json')
