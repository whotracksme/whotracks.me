
from datetime import datetime
from urllib.parse import quote_plus
import io
import pkg_resources
import pandas as pd
import sqlite3
from collections import namedtuple
from operator import itemgetter
from whotracksme.data.db import load_tracker_db, create_tracker_map, WhoTracksMeDB, DATA_COLUMNS


def asset_exists(name):
    return pkg_resources.resource_exists('whotracksme.data', f'assets/{name}')


def asset_stream(name):
    stream = pkg_resources.resource_stream(
        'whotracksme.data',
        f'assets/{name}',
    )
    in_memory_stream = io.BytesIO(stream.read())
    stream.close()
    return in_memory_stream


def list_available_months(region="global"):
    months = []
    for asset in pkg_resources.resource_listdir('whotracksme.data', 'assets'):
        try:
            month = datetime.strptime(asset, '%Y-%m')
        except ValueError:
            pass
        else:
            # Making sure the region is availabe in a given month
            if pkg_resources.resource_isdir('whotracksme.data', f'assets/{asset}/{region}'):
                months.append(asset)
    return months


class DataSource:
    def __init__(self, region="global", populate=True):
        self.data_months = sorted(list_available_months(region=region))
        if populate:
            print('data available for months:\n├──', "\n├── ".join(self.data_months))

        # Add demographics info to trackers and companies
        self.db = WhoTracksMeDB()

        self.sites_trackers = SitesTrackers(
            data_months=[max(self.data_months)],
            region=region,
            db=self.db,
            populate=False,
        )
        self.trackers = Trackers(
            data_months=self.data_months,
            region=region,
            db=self.db,
            populate=populate,
        )
        self.companies = Companies(
            data_months=[max(self.data_months)],
            region=region,
            db=self.db,
            populate=populate,
        )
        self.sites = Sites(
            data_months=[max(self.data_months)],
            region=region,
            db=self.db,
            populate=populate,
        )

    def __enter__(self):
        return self

    def __exit__(self, *args):
        self.db.connection.close()

    @staticmethod
    def normalize_url(url_substring):
        return quote_plus(url_substring.replace('/', ' ')).lower()

    def url_for(self, entity, id, path_to_root='.'):
        if entity == 'tracker':
            return f'{path_to_root}/trackers/{self.normalize_url(id)}.html'
        elif entity == 'company':
            return f'{path_to_root}/companies/{self.normalize_url(id)}.html'
        elif entity == 'site':
            return f'{path_to_root}/websites/{self.normalize_url(id)}.html'.lower()
        elif entity == 'blog':
            return f'{path_to_root}/blog/{self.normalize_url(id)}.html'

    def get_company_name(self, id):
        result = self.db.connection.execute('SELECT name FROM companies WHERE id = ?', (id,)).fetchone()
        if result is not None:
            return result[0]
        return id

def parse_date(date_string):
    return datetime.strptime(date_string, '%Y-%m')


DataRowTypes = {
    "trackers": namedtuple('TrackerDataPoint', 'id, month, country, tracker, company_id, category_id, category,' + ','.join(DATA_COLUMNS['trackers'])),
}

class SQLDataLoader:

    def __init__(self, data_months, name, db, region='global', id_column=None, extra_columns=[]):
        self.name = name
        self.last_month = max(data_months)
        self.db = db
        self.id_column = id_column
        self.region = region
        self.extra_column_select = []
        self.extra_joins = ''
        self.table_name = f'{self.name}_data'
        # infer table structure
        self.columns = [row[1] for row in self.db.connection.execute(f'PRAGMA table_info("{self.table_name}")')]
        self.rowType = namedtuple(f'{self.name}DataPoint', ','.join(['id'] + self.columns + extra_columns))

    def get_data_query(self):
        return f'''
            SELECT
                {self.id_column} AS id,
                {','.join([f'{self.table_name}.{c}' for c in self.columns])}
                {',' if len(self.extra_column_select) > 0 else ''}
                {','.join(self.extra_column_select)}
            FROM {self.table_name}
            {self.extra_joins}
        '''

    def sort_by(self, metric="reach", descending=True):
        columns = ','.join(DATA_COLUMNS['trackers'])
        cursor = self.db.connection.execute(f'''
            {self.get_data_query()}
            WHERE {self.table_name}.country=? AND month = ?
            ORDER BY "{metric}" {'DESC' if descending else 'ASC'}
        ''', (self.region, self.last_month))
        return list(map(self.rowType._make, cursor.fetchall()))

    def get_snapshot(self, month=None):
        cursor = self.db.connection.execute(f'''
            {self.get_data_query()}
            WHERE {self.table_name}.country = ? AND month = ?
        ''', (self.region, month or self.last_month))
        return list(map(self.rowType._make, cursor.fetchall()))

    def iter(self):
        for row in self.get_snapshot():
            yield row.id, row

    def get_datapoint(self, id, month=None):
        result = self.db.connection.execute(f'''
            {self.get_data_query()}
            WHERE {self.table_name}.country= ? AND month = ? AND {self.id_column} = ?
        ''', (self.region, month or self.last_month, id)).fetchone()
        if result is not None:
            return self.rowType._make(result)
        return None

    def dump(self):
        cursor = self.db.connection.execute(f'''
            {self.get_data_query()}
            WHERE {self.table_name}.country = ?
        ''', (self.region,))
        return list(map(self.rowType._make, cursor.fetchall()))

class Trackers(SQLDataLoader):

    def __init__(self, data_months, db, region='global', populate=True):
        super().__init__(data_months, name='trackers', db=db, region=region, id_column='tracker',
                         extra_columns=['company_id', 'category_id', 'category'])
        self.extra_column_select = [
            'trackers.company_id',
            'trackers.category_id',
            'categories.name AS category',
        ]
        self.extra_joins = '''
            LEFT JOIN trackers ON trackers.id = trackers_data.tracker
            LEFT JOIN categories ON trackers.category_id = categories.id
        '''
        self.info = {}

        if populate:
            for month in data_months:
                self.db.load_data('trackers', self.region, month)
            self.db.load_data('sites_trackers', self.region, self.last_month)
            self.db.load_data('sites', self.region, self.last_month)

    # Summary methods across all trackers
    # -----------------------------------

    def summary_stats(self):
        """
        Returns: Summary stats across all trackers.

        """
        # snapshot of last month in the data
        cursor = self.db.connection.execute('''
            SELECT
            COUNT(tracker) as count,
            COUNT(CASE WHEN reach > 0.001 THEN 1 ELSE NULL END) as gt01,
            COUNT(CASE WHEN cookies > 0.2 THEN 1 ELSE NULL END) as by_cookies,
            COUNT(CASE WHEN bad_qs > 0.1 THEN 1 ELSE NULL END) as by_fingerprinting,
            AVG(content_length) as data
            FROM trackers_data
            WHERE country=? AND month = ?
        ''', (self.region, self.last_month))
        result = cursor.fetchone()
        return {
            'count': result[0],
            'gt01': result[1],
            'by_cookies': float(result[2]) / result[0],
            'by_fingerprinting': float(result[3]) / result[0],
            'data': result[4]
        }

    # Methods for a specific Tracker
    # ------------------------------
    def get_tracker(self, id):
        if id in self.info:
            return self.info[id]

        cursor = self.db.connection.execute('''
            SELECT
                t.id,
                t.name,
                c.name AS category,
                t.website_url,
                t.ghostery_id,
                t.company_id,
                com.name AS company_name,
                com.description,
                com.privacy_url
            FROM trackers AS t
            JOIN categories AS c ON c.id = t.category_id
            LEFT JOIN companies AS com ON com.id = t.company_id
            WHERE t.id = ?
            ''', (id,))
        cols = ['id', 'name', 'category', 'website_url', 'ghostery_id', 'company_id',
            'company_name', 'description',
            'privacy_url']
        row = cursor.fetchone()
        tracker_info = {c: row[i] for i, c in enumerate(cols)}

        cursor = self.db.connection.execute('''
            SELECT tracker, MIN(month), MAX(month)
            FROM trackers_data
            WHERE country = ? AND tracker = ?
            GROUP BY tracker
        ''', (self.region, id))
        date_range = cursor.fetchone()
        if date_range is not None:
            tracker_info['date_range'] = [parse_date(date_range[1]), parse_date(date_range[2])]

        cursor = self.db.connection.execute('''
            SELECT
                t.id,
                dom.domain as domains
            FROM trackers AS t
            LEFT JOIN tracker_domains AS dom ON dom.tracker = t.id
            WHERE t.id = ?
        ''', (id, ))
        tracker_info['domains'] = [x[1] for x in cursor.fetchall()]

        overview = self.get_datapoint(id)
        if overview is not None:
            tracker_info['overview'] = overview._asdict()

        self.info[id] = tracker_info
        return tracker_info

    def get_name(self, id):
        return self.get_tracker(id).get('name')

    def get_rank(self, id):
        return self.get_tracker(id).get('overview', {}).get('reach_rank')

    def get_rank_label(self, id):
        """
        Args:
            id: id of tracker

        Returns: Label based on rank

        """
        r = self.get_rank(id)
        if r < 3:
            return 'Dangerously prevalent'
        if 3 <= r < 11:
            return 'Extremely prevalent'
        if 11 <= r < 50:
            return 'Very prevalent'
        if 51 <= r <= 100:
            return 'Commonly prevalent'
        if 101 <= r:
            return 'Relatively prevalent'

    def get_tracking_methods(self, id):
        """
        Args:
            id: id of tracker to access

        Returns: {'cookies:: bool, 'fingerprinting':: bool}
                based on chosen threshold by privacy team.

        """
        methods = {
            'cookies': False,
            'fingerprinting': False
        }
        if self.get_tracker(id).get('overview', {}).get('cookies') > 0.1:
            methods['cookies'] = True
        if self.get_tracker(id).get('overview', {}).get('bad_qs') > 0.1:
            methods['fingerprinting'] = True
        return methods

    def get_reach(self, id):
        cursor = self.db.connection.cursor()
        cursor.execute('''
            SELECT month, reach, site_reach_top10k FROM trackers_data
            WHERE country = ? AND tracker = ?
            ORDER BY month ASC
        ''', (self.region, id))
        reach = []
        months = []
        site_reach = []
        for row in cursor.fetchall():
            m, r, s = row
            reach.append(r)
            months.append(parse_date(m))
            if s is not None:
                site_reach.append(s)
        return {
            'page': reach,
            'ts': months,
            'site': site_reach,
        }

    def get_presence_by_site_category(self, id):
        cursor = self.db.connection.cursor()
        cursor.execute('''
            SELECT category, COUNT(*) AS count
            FROM sites_trackers_data AS st
            JOIN sites_data ON
                st.month = sites_data.month
                AND st.country = sites_data.country
                AND st.site = sites_data.site
            WHERE st.month = ?
                AND st.country = ?
                AND tracker = ?
            GROUP BY sites_data.category
            ORDER BY count DESC
        ''', (self.last_month, self.region, id))
        results = cursor.fetchall()
        site_count = sum(map(itemgetter(1), results))
        return [(category, 100 * float(count) / site_count) for category, count in results]

    def similar_trackers(self, id, n=4):
        """
        Args:
            id: id of tracker for which similar trackers will be found
            n: number of similar trackers to find

        Returns:
            top_n: list of similar trackers, each having an id
                   and the company_id
        """
        tracker = self.get_tracker(id)

        cursor = self.db.connection.cursor()
        cursor.execute(f'''
            SELECT tracker, company_id
            FROM trackers_data
            JOIN trackers ON trackers.id = trackers_data.tracker
            WHERE month = ? AND country = ?
                AND category_id = ?
                AND tracker != ?
            ORDER BY reach DESC
            LIMIT {n}
        ''', (self.last_month, self.region, tracker['overview']['category_id'], id))
        return [{
            'id': t,
            'company_id': cid
        } for t, cid in cursor.fetchall()]

    def get_domains(self, id):
        try:
            if self.get_tracker(id) is not None:
                return self.get_tracker(id).get('domains', [])
            else:
                return []
        except Exception as e:
            print(e)

    def iter_sites(self, id):
        for site in self.sites.get_tracker(id).itertuples():
            yield site


SiteTrackerEntry = namedtuple('SiteTrackerEntry', 'site, tracker, name, category, company_id, company, site_proportion')

class Sites(SQLDataLoader):
    def __init__(self, data_months, db, region='global', populate=True):
        super().__init__(data_months, name='sites', db=db, region=region, id_column='site',
                         extra_columns=[])

        if populate:
            for month in data_months:
                self.db.load_data('sites', self.region, month)
            self.db.load_data('sites_trackers', self.region, max(data_months))

    # Summary methods across all sites
    # --------------------------------

    def summary_stats(self):
        """
        Returns: aggregate tracker statistics across all sites in database

        """
        cursor = self.db.connection.execute('''
            SELECT
            COUNT(site) as count,
            AVG(tracked) as have_trackers,
            COUNT(CASE WHEN trackers >= 10 THEN 1 ELSE NULL END) as gt10,
            AVG(trackers) as average_nr_trackers,
            AVG(requests_tracking) as requests_tracking,
            AVG(content_length) as data
            FROM sites_data
            WHERE country=? AND month = ?
        ''', (self.region, self.last_month))
        result = cursor.fetchone()
        return {
            'count': result[0],
            'have_trackers': result[1],
            'gt10': result[2],
            'average_nr_trackers': result[3],
            'tracker_requests': int(result[4]),
            'data': result[5]
        }

    # Methods for one specific site
    # -----------------------------
    def get_name(self, id):
        # NOTE: This is weird
        return id if len(self.get_site(id)) > 0 else None

    def get_tracker_list(self, site, month=None):
        query = '''
            SELECT
                site,
                tracker,
                trackers.name,
                categories.name AS category,
                CASE WHEN trackers.company_id IS NULL THEN '' ELSE trackers.company_id END AS company_id,
                CASE WHEN companies.name IS NULL THEN '' ELSE companies.name END AS company,
                site_proportion
            FROM sites_trackers_data
            JOIN trackers ON trackers.id = sites_trackers_data.tracker
            JOIN categories ON trackers.category_id = categories.id
            LEFT JOIN companies ON companies.id = trackers.company_id
            WHERE month = ? AND sites_trackers_data.country = ?
                AND site = ? AND category != "extensions"
            ORDER BY site_proportion DESC
        '''
        return map(SiteTrackerEntry._make, self.db.connection.execute(query, (month or self.last_month, self.region, site)))

    def trackers_on_site(self, site, month=None):
        """
        Args:
            id: a site dict from self._sites
            trackers: DataSource.trackers
            companies: DataSource.companies

        Returns:
            tracker :: dict,
            category :: string,
            company_name :: string
        """
        for row in self.get_tracker_list(site, month):
            if row.company == '':
                continue
            tracker = {
                'id': row.tracker,
                'name': row.name,
                'frequency': row.site_proportion,
            }
            yield (tracker, row.category, row.company)

    def mean_trackers_timeseries(self, id):
        """
        Args:
            id: id, e.g.: ebay.de

        Returns: [(ts0, mean_trackers0, ... ]
        """
        return [(s.get('ts'), s.get('mean_trackers'))
                for s in self.get_site(id).get('history')]

    def get_site_tracker_categories(self, site, month=None):
        query = '''
            SELECT
                categories.name AS category,
                COUNT(tracker) AS frequency
            FROM sites_trackers_data
            JOIN trackers ON trackers.id = sites_trackers_data.tracker
            JOIN categories ON trackers.category_id = categories.id
            WHERE month = ? AND sites_trackers_data.country = ?
                AND site = ?
            GROUP BY category
            ORDER BY frequency DESC
        '''
        return self.db.connection.execute(query, (month or self.last_month, self.region, site))


class SitesTrackers(SQLDataLoader):

    def __init__(self, data_months, db, region='global', populate=True):
        super().__init__(data_months, name='sites_trackers', db=db, region=region,
                         id_column='site || tracker', extra_columns=[])


class Companies(SQLDataLoader):

    def __init__(self, data_months, db, region='global', populate=True):
        super().__init__(data_months, name='companies', db=db, region=region, id_column='company',
                         extra_columns=['name'])
        self.extra_column_select = [
            'companies.name',
        ]
        self.extra_joins = '''
            LEFT JOIN companies ON companies.id = companies_data.company
        '''

        if populate:
            for month in data_months:
                self.db.load_data('companies', self.region, month)
