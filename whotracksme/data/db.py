import json
import requests
import sqlite3
import pkg_resources
import itertools
import io
import csv
from hashlib import md5

def asset_string(name):
    return pkg_resources.resource_string(
        'whotracksme.data',
        f'assets/{name}').decode('utf-8')


def load_tracker_db(loc=':memory:'):
    connection = sqlite3.connect(loc)
    import_trackers(connection)
    return connection


def import_trackers(connection):
    with connection:
        connection.executescript(asset_string('trackerdb.sql'))

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


INT_COLUMNS = ['site_reach_top10k', 'reach_rank', 'site_reach_rank', 'site_rank', 'tracker_rank']

def get_column_type(col):
    if col in INT_COLUMNS:
        return 'INTEGER'
    return 'REAL'

BASE_DATA_COLUMNS = [
    "cookies",
    "bad_qs",
    "tracked",
    "https",
    "requests",
    "requests_tracking",
    "content_length",
    "requests_failed",
    "has_blocking",
    "script",
    "iframe",
    "beacon",
    "image",
    "stylesheet",
    "font",
    "xhr",
    "plugin",
    "media",
    "referer_leaked",
    "referer_leaked_header",
    "referer_leaked_url",
    "hosts",
    "trackers",
    "companies",
]

DATA_COLUMNS = {
    'trackers': [
        "reach",
        "site_reach",
        "site_reach_top10k",
        "site_avg_frequency"
    ] + BASE_DATA_COLUMNS + [
        "reach_rank",
        "site_reach_rank"
    ],
    'sites': [
        'popularity'
    ] + BASE_DATA_COLUMNS,
    'sites_trackers': [
        'site_proportion',
        'tracker_proportion',
        'site_rank',
        'tracker_rank',
    ] + BASE_DATA_COLUMNS
}
DATA_COLUMNS['companies'] = DATA_COLUMNS['trackers']
DATA_COLUMNS['domains'] = DATA_COLUMNS['trackers']

class WhoTracksMeDB:

    TABLES = {
        'import_checksums': ['CREATE TABLE import_checksums (filename TEXT UNIQUE, checksum TEXT);'],
        'trackers_data': ['''CREATE TABLE trackers_data (
            month TEXT,
            country TEXT,
            tracker TEXT,
            {0}
            );'''.format(','.join([f'{col} {get_column_type(col)}' for col in DATA_COLUMNS['trackers']])),
            'CREATE UNIQUE INDEX trackers_data_pkey ON trackers_data (month, country, tracker);'],
        'companies_data': ['''CREATE TABLE companies_data (
            month TEXT,
            country TEXT,
            company TEXT,
            {0}
            );'''.format(','.join([f'{col} {get_column_type(col)}' for col in DATA_COLUMNS['companies']])),
            'CREATE UNIQUE INDEX companies_data_pkey ON companies_data (month, country, company);'],
        'domains_data': ['''CREATE TABLE domains_data (
            month TEXT,
            country TEXT,
            domain TEXT,
            {0}
            );'''.format(','.join([f'{col} {get_column_type(col)}' for col in DATA_COLUMNS['domains']])),
            'CREATE UNIQUE INDEX domains_data_pkey ON domains_data (month, country, domain);'],
        'sites_data': ['''CREATE TABLE sites_data (
            month TEXT,
            country TEXT,
            site TEXT,
            category TEXT,
            {0}
            );'''.format(','.join([f'{col} {get_column_type(col)}' for col in DATA_COLUMNS['sites']])),
            'CREATE UNIQUE INDEX sites_data_pkey ON sites_data (month, country, site);'],
        'sites_trackers_data': ['''CREATE TABLE sites_trackers_data (
            month TEXT,
            country TEXT,
            site TEXT,
            tracker TEXT,
            {0}
            );'''.format(','.join([f'{col} {get_column_type(col)}' for col in DATA_COLUMNS['sites_trackers']])),
            'CREATE UNIQUE INDEX sites_trackers_data_pkey ON sites_trackers_data (month, country, site, tracker);',
            'CREATE INDEX sites_trackers_sites ON sites_trackers_data (month, country, site)',
            'CREATE INDEX sites_trackers_trackers ON sites_trackers_data (month, country, tracker)',
            'CREATE INDEX sites_trackers_tracker_proportion ON sites_trackers_data (tracker_proportion)'],
    }
    TRACKER_TABLES = ['categories', 'companies', 'iab_vendors', 'tracker_domains', 'trackers', 'truste_companies', 'urls']
    NAME_COLUMN_MAP = {
        'trackers': ['tracker'],
        'companies': ['company'],
        'domains': ['host_tld'],
        'sites': ['site', 'category'],
        'sites_trackers': ['site', 'tracker']
    }

    def __init__(self):
        self.connection = sqlite3.connect('./whotracksme.db')
        existing_tables = self._get_existing_tables()
        # create tables
        with self.connection:
            # increase cache size
            self.connection.execute('PRAGMA cache_size = -20000;')

            for table, create_statement in WhoTracksMeDB.TABLES.items():
                if table not in existing_tables:
                    for stmt in create_statement:
                        self.connection.execute(stmt)

            # import trackerdb
            trackerdb_file = 'trackerdb.sql'
            trackerdb_sql = asset_string('trackerdb.sql')
            trackerdb_sql_hash = md5(trackerdb_sql.encode('utf-8')).hexdigest()
            if 'trackers' not in existing_tables:
                print('load trackers')
                self.connection.executescript(trackerdb_sql)
            elif trackerdb_sql_hash != self.get_file_checksum('trackerdb.sql'):
                print('reload trackers')
                for table in WhoTracksMeDB.TRACKER_TABLES:
                    self.connection.execute(f'DROP table {table}')
                self.connection.executescript(trackerdb_sql)
                self.update_file_checksum(trackerdb_file, trackerdb_sql_hash)

            # turn off journalling

    def _get_existing_tables(self):
        return [row[0] for row in self.connection.execute("SELECT name FROM sqlite_master WHERE type='table'")]

    def get_file_checksum(self, filename):
        cursor = self.connection.cursor()
        cursor.execute('SELECT checksum FROM import_checksums WHERE filename = ?', (filename, ))
        result = cursor.fetchone()
        if result is not None:
            return result[0]
        return ''

    def update_file_checksum(self, filename, checksum):
        self.connection.execute('DELETE FROM import_checksums WHERE filename = ?', (filename, ))
        self.connection.execute('INSERT INTO import_checksums VALUES (?, ?)', (filename, checksum))

    def load_data(self, name, region, month):
        path = f'{month}/{region}/{name}.csv'
        stream = pkg_resources.resource_stream(
            'whotracksme.data',
            f'assets/{path}',
        )
        file_bytes = stream.read()
        file_hash = md5(file_bytes).hexdigest()
        if self.get_file_checksum(path) != file_hash:
            with self.connection:
                print('update/create data for', path)
                # delete old data
                self.connection.execute(f'DELETE FROM {name}_data WHERE month=? AND country=?', (month, region))
                # read in csv file and insert
                reader = csv.DictReader(io.StringIO(file_bytes.decode('utf8')))
                rows = []
                name_columns = self.NAME_COLUMN_MAP[name]

                def parse_col_value(name, value):
                    try:
                        if name in INT_COLUMNS:
                            return int(value)
                        return float(value)
                    except:
                        return None

                for row in reader:
                    rowtuple = [row['month'], row['country']] + \
                        [row[col] for col in name_columns] + \
                        [parse_col_value(col, row.get(col, '')) for col in DATA_COLUMNS[name]]
                    rows.append(tuple(rowtuple))

                columns = ','.join(['?'] * (len(DATA_COLUMNS[name]) + len(name_columns) + 2))
                self.connection.executemany(f'INSERT INTO {name}_data VALUES ({columns})', tuple(rows))

                # update checksum
                self.update_file_checksum(path, file_hash)
