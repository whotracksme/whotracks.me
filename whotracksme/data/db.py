import json
import requests
import sqlite3
import pkg_resources
import itertools

def asset_string(name):
    return pkg_resources.resource_string(
        'whotracksme.data',
        f'assets/{name}').decode('utf-8')


def load_tracker_db(loc=':memory:'):
    connection = sqlite3.connect(loc)
    with connection:
        connection.executescript(asset_string('trackerdb.sql'))
    return connection


def create_tracker_map(db, with_iab_vendors=False):
    # load tracker info
    cur = db.cursor()
    cur.execute('''
        SELECT
            t.id,
            t.name,
            c.name AS category,
            t.website_url,
            t.ghostery_id,
            t.company_id,
            iab.id AS iab_vendor,
            truste.type AS truste_type,
            truste.description,
            truste.privacy_url,
            com.privacy_url
        FROM trackers AS t
        JOIN categories AS c ON c.id = t.category_id
        LEFT JOIN companies as com ON com.id = t.company_id
        LEFT JOIN iab_vendors as iab ON iab.tracker = t.id
        LEFT JOIN truste_companies as truste ON truste.tracker = t.id
    ''')
    trackers = {}
    cols = ['id', 'name', 'category', 'website_url', 'ghostery_id', 'company_id', 'iab_vendor',
            'truste_type', 'description', 'truste_privacy_url',
            'privacy_url']
    for row in cur.fetchall():
        entry = {c: row[i] for i, c in enumerate(cols)}
        if entry['privacy_url'] is None or len(entry['privacy_url']) == 0:
            entry['privacy_url'] = entry['truste_privacy_url']
        del entry['truste_privacy_url']
        trackers[entry['id']] = entry

    # load company info
    cur.execute('''
        SELECT
            com.id,
            com.name,
            com.description,
            com.website_url,
            com.ghostery_id,
            iab.id AS iab_vendor,
            truste.type AS truste_type,
            truste.description,
            truste.privacy_url,
            com.privacy_url
        FROM companies AS com
        LEFT JOIN iab_vendors as iab ON iab.company = com.id
        LEFT JOIN truste_companies as truste ON truste.company = com.id;
    ''')
    companies = {}
    for row in cur.fetchall():
        c = dict([
            ('id', row[0]),
            ('name', row[1]),
            ('description', row[2] if row[2] is not None and len(row[2]) > 0 else row[7]),
            ('website_url', row[3]),
            ('ghostery_id', row[4]),
            ('iab_vendor', row[5]),
            ('truste_type', row[6]),
            ('privacy_url', row[9] if row[9] is not None and len(row[9]) > 0 else row[8])
        ])
        companies[c['id']] = c

    # get tracker domains
    cur.execute('SELECT tracker, domain from tracker_domains')
    for row in cur.fetchall():
        tracker, domain = row
        domains = trackers[tracker]['domains'] if 'domains' in trackers[tracker] else []
        domains.append(domain)
        trackers[tracker]['domains'] = domains

    tracker_map = {
        'trackers': trackers,
        'companies': companies,
    }

    if with_iab_vendors:
        vendorlist = get_iab_vendorlist()
        include_vendors = set([int(tracker['iab_vendor'])
            for tracker in itertools.chain(trackers.values(), companies.values())
            if tracker['iab_vendor'] is not None])
        tracker_map['iab'] = {
            'vendorListVersion': vendorlist['vendorListVersion'],
            'purposes': vendorlist['purposes'],
            'features': vendorlist['features'],
            'vendors': {
                vendor['id']: vendor
                for vendor in vendorlist['vendors'] if vendor['id'] in include_vendors
            }
        }

    return tracker_map


iab_vendorlist_url = 'https://vendorlist.consensu.org/vendorlist.json'


def get_iab_vendorlist():
    iab_list = json.loads(requests.get(iab_vendorlist_url).content)
    return iab_list
