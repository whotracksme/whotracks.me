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

def list_full_bucket(s3_client, bucket_name, bucket_prefix):
    keys = []
    is_truncated = True
    next_marker = ''
    while is_truncated == True:
        response = s3_client.list_objects(Bucket=bucket_name, Prefix=bucket_prefix[1:], Marker=next_marker)
        if 'Contents' not in response:
            break
        if 'IsTruncated' in response:
            is_truncated = response['IsTruncated']
        fetched_keys = [obj['Key'] for obj in response['Contents']]
        keys += fetched_keys
        next_marker = fetched_keys[-1]
    return keys

def get_max_age(path, filename):
    if path.startswith('static/'):
        # font resources: one month cache
        if 'font-awesome-4.7.0' in path or 'fonts' in path:
            return 2592000
        # minified JS: one week cache
        if '.min.js' in filename or '.min.css' in filename:
            return 604800
        # one day cache
        return 86400
    # default 30min cache for html pages
    return 1800

def get_cache_control(path, filename, production=False):
    if not production:
        # one minute cache
        return 'max-age=60'
    return 'max-age={}'.format(get_max_age(path, filename))


def get_content_type(local_path):
    mime = MimeTypes()
    guessed_type = mime.guess_type(local_path)[0]
    if guessed_type is None:
        if local_path.endswith('.css.map') or local_path.endswith('.js.map'):
            return 'application/json'
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

    # bucket = s3.Bucket(bucket_name)

    # list existing bucket contents
    existing_keys = set(list_full_bucket(s3_client, bucket_name, bucket_prefix))
    print('Bucket contains', len(existing_keys), 'pages')
    uploaded = 0
    redirected = 0

    for (dirpath, dirnames, filenames) in os.walk(site_dir):
        print('Enter', dirpath)
        s3_suffix = dirpath[len(site_dir) + 1:]
        for filename in filenames:
            if filename[0] == '.':
                continue

            local_path = os.path.join(dirpath, filename)
            s3_path = os.path.join(bucket_prefix, s3_suffix, filename)[1:]
            cache_control = get_cache_control(s3_suffix, filename, production=production)
            content_type = get_content_type(local_path)

            print('put', local_path, s3_path)
            with open(local_path, 'rb') as fp:
                s3_client.put_object(Bucket=bucket_name, Key=s3_path, Body=fp,
                                     CacheControl=cache_control,
                                     ContentType=content_type)
                uploaded += 1

            # setup redirects
            html_path = f'{s3_path}.html'
            if html_path in existing_keys:
                print(f'redirect {html_path} to /{s3_path}')
                s3_client.put_object(Bucket=bucket_name, Key=html_path,
                                     WebsiteRedirectLocation=f'/{s3_path}')
                redirected += 1

    print(f'Complete: uploaded {uploaded}, redirected {redirected}')