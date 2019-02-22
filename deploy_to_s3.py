"""
Module to deploy WhoTracksMe site to an s3 bucket.

Usage:
    deploy_to_s3 <bucket_name> [<prefix>] [--production]

Options:
    -h, --help                  Show help message.
    --production                Production deployment (set cache-control metadata)
"""
import os
import boto3
from docopt import docopt
from mimetypes import MimeTypes
from concurrent.futures import ProcessPoolExecutor

def iterate_bucket(s3_client, bucket_name, bucket_prefix):
    pageinator = s3_client.get_paginator('list_objects_v2')

    for page in pageinator.paginate(Bucket=bucket_name, Prefix=bucket_prefix):
        if page['KeyCount'] == 0:
            continue

        for item in page['Contents']:
            yield item['Key']

def get_max_age(path, filename):
    if path.startswith('static/'):
        # font resources: one month cache
        if 'font-awesome-4.7.0' in path or 'fonts' in path:
            return 2592000
        # minified JS: one week cache
        if '.min.js' in filename or '.min.css' in filename:
            return 604800
        # one week cache
        return 604800
    elif path.startswith('data/'):
        # trackerdb: 1day cache
        if 'trackerdb.' in path:
            return 86400
        # rest of data directory: 1 week cache
        return 604800
    # default 1day cache for html pages
    return 86400

def get_cache_control(path, filename, production=False):
    if not production:
        # one minute cache
        return 'max-age=60'
    return f'max-age={get_max_age(path, filename)}'


def get_content_type(local_path):
    mime = MimeTypes()
    guessed_type = mime.guess_type(local_path)[0]
    if guessed_type is None:
        if local_path.endswith('.css.map') or local_path.endswith('.js.map'):
            return 'application/json'
        elif local_path.endswith('.otf'):
            return 'font/opentype'
        elif local_path.endswith('.eot'):
            return 'application/vnd.ms-fontobject'
        elif local_path.endswith('.ttf'):
            return 'application/font-sfnt'
        elif local_path.endswith('.woff'):
            return 'application/font-woff'
        elif local_path.endswith('.woff2'):
            return 'application/font-woff2'
        elif local_path.endswith('.zip'):
            return 'application/zip'
        elif local_path.endswith('.pack'):
            return 'application/octet-stream'
        return 'text/html'
    return guessed_type

if __name__ == '__main__':
    args = docopt(__doc__)
    bucket_name = args['<bucket_name>']
    bucket_prefix = args['<prefix>'] or '/'
    production = args['--production']
    site_dir = './_site'

    if bucket_prefix[0] != '/':
        bucket_prefix = '/' + bucket_prefix
    print('Deploying site to ', f's3://{bucket_name}{bucket_prefix}')

    # check site build exists
    if not os.path.isdir(site_dir):
        print('_site directory does not exist. You need to build the site before uploading')
        exit(1)

    # connect s3
    s3_client = boto3.client('s3')

    # list existing bucket contents
    existing_keys = set(iterate_bucket(s3_client, bucket_name, bucket_prefix[1:]))
    print('Bucket contains', len(existing_keys), 'pages')
    uploaded = 0
    redirected = 0

    def upload_file_to_s3(path, filename):
        # path to local file
        local_path = os.path.join(path, filename)
        # relative folder of file
        s3_suffix = path[len(site_dir) + 1:]
        # full path from root of bucket
        s3_path = os.path.join(bucket_prefix, s3_suffix, filename)[1:]

        # metadata to set on file
        cache_control = get_cache_control(s3_suffix, filename, production=production)
        content_type = get_content_type(local_path)

        print('put', local_path, s3_path)
        with open(local_path, 'rb') as fp:
            s3_client.put_object(Bucket=bucket_name, Key=s3_path, Body=fp,
                                 CacheControl=cache_control,
                                 ContentType=content_type)

        # setup redirects
        html_path = f'{s3_path}.html'
        if html_path in existing_keys:
            print(f'redirect {html_path} to /{s3_path}')
            s3_client.put_object(Bucket=bucket_name, Key=html_path,
                                 WebsiteRedirectLocation=f'/{s3_path}')
            # upload + redirect
            return True, True
        else:
            # upload, no redirect
            return True, False

    with ProcessPoolExecutor(max_workers=8) as executor:
        uploads = []
        for (dirpath, dirnames, filenames) in os.walk(site_dir):
            print('Enter', dirpath)
            files_to_upload = [f for f in filenames if not f[0] == '.']
            for filename in files_to_upload:
                uploads.append(executor.submit(upload_file_to_s3, dirpath, filename))

        for future in uploads:
            did_upload, did_redirect = future.result()
            if did_upload:
                uploaded += 1
            if did_redirect:
                redirected += 1

    print(f'Complete: uploaded {uploaded}, redirected {redirected}')
