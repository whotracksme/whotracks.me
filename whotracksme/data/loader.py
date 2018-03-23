
from urllib.parse import quote_plus
from collections import Counter, defaultdict
from statistics import mean
from datetime import datetime
import json
import sqlite3
import pkgutil
import os
import pandas as pd
import re

def load_asset(name):
    return pkgutil.get_data(
        'whotracksme',
        f'data/assets/{name}'
    ).decode('utf-8')


def load_tracker_db(loc=':memory:'):
    connection = sqlite3.connect(loc)
    with connection:
        connection.executescript(load_asset('trackerdb.sql'))
    return connection


def get_data_dir():
    module_info = list(filter(lambda mod: mod.name == 'whotracksme.data.assets', pkgutil.walk_packages('whotracksme.data')))[0]
    return f'{module_info.module_finder.path}/assets'


class DataSource:
    def __init__(self):
        # _apps = load_apps()
        # _sites = load_sites()
        # self.companies = load_companies()
        # self.overview = load_overview()
        self.data_dir = get_data_dir()
        month_matcher = re.compile('[0-9]{4}-[0-9]{2}')
        self.data_months = [month for month in os.listdir(self.data_dir) if os.path.isdir(f'{self.data_dir}/{month}') and month_matcher.fullmatch(month) is not None]
        print('data available for months:', self.data_months)

        # Add demographics info to trackers and companies
        connection = load_tracker_db()
        with connection:
            self.app_info = self.load_app_info(connection)
            self.company_info = self.load_company_info(connection)

        self.sites_trackers = SitesTrackers(self.data_dir, [max(self.data_months)], self.app_info)
        self.trackers = Trackers(self.data_dir, self.data_months, self.app_info, self.sites_trackers)
        self.companies = Companies(self.data_dir, self.data_months, self.company_info, self.app_info)
        self.sites = Sites(self.data_dir, self.data_months, self.sites_trackers)

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
        return self.company_info.get(id).get('name') \
            if id in self.company_info else id

    def load_app_info(self, connection):
        col_names = [
            'id', 'name', 'cat', 'website_url',
            'company_id'
        ]
        cur = connection.execute(
            '''SELECT trackers.id, trackers.name,
            categories.name, website_url, company_id
            FROM trackers
            LEFT JOIN categories ON categories.id = category_id'''
        )
        app_info = {}
        for row in cur:
            app_info[row[0]] = {col: row[i] for i, col in enumerate(col_names)}
            app_info[row[0]]['domains'] = []

        cur = connection.execute('SELECT tracker, domain FROM tracker_domains')
        for app, domain in cur:
            app_info[app]['domains'].append(domain)

        return app_info

    def load_company_info(self, connection):
        columns = [
            'id', 'name', 'description', 'privacy_url', 'website_url',
        ]
        cur = connection.execute(
            '''SELECT {} FROM companies'''.format(','.join(columns))
        )
        company_info = {}
        for row in cur:
            company_info[row[0]] = {col: row[i] for i, col in enumerate(columns)}
            company_info[row[0]]['apps'] = {}

        cur = connection.execute(
            '''SELECT company_id, id, name
            FROM trackers
            WHERE company_id IS NOT NULL'''
        )
        for cid, app_id, app_name in cur:
            company_info[cid]['apps'][app_id] = app_name

        return company_info


class PandasDataLoader:

    def __init__(self, data_dir, data_months, name, region='global', id_column=None):
        self.last_month = max(data_months)
        self.df = pd.concat([pd.read_csv(f'{data_dir}/{month}/{region}/{name}.csv') for month in data_months])
        self.id_col = id_column or self.df.columns[2]

    def iter(self):
        for row in self.get_snapshot().itertuples():
            yield (row._asdict()[self.id_col], row)

    def sort_by(self, metric="reach", descending=True):
        """
        Args:
            metric:: string - Shared attribute of trackers to sort by
            descending:: bool

        Returns: list of tracker objects, sorted by metric

        """
        return self.get_snapshot().sort_values(by=[metric], ascending=not descending)

    def get_snapshot(self, month=None):
        return self.df[self.df.month == (month or self.last_month)]


class Trackers(PandasDataLoader):
    def __init__(self, data_dir, data_months, tracker_info, sites, region='global'):
        super().__init__(data_dir, data_months, name='trackers', region=region)

        self.info = tracker_info
        # add company_id column
        self.df['company_id'] = pd.Series(
            [tracker_info.get(tracker, {}).get('company_id', tracker)
            for tracker in self.df.tracker], index=self.df.index)
        self.df['category'] = pd.Series(
            [tracker_info.get(tracker, {}).get('cat', 'unknown')
            for tracker in self.df.tracker], index=self.df.index)

        self.sites = sites

        for row in self.get_snapshot().itertuples():
            if row.tracker in self.info:
                self.info[row.tracker]['overview'] = row._asdict()
            else:
                print('missing tracker info:', row.tracker)
                self.info[row.tracker] = {
                    'id': row.tracker,
                    'name': row.tracker,
                    'overview': row._asdict()
                }

        last_month = datetime.strptime(max(data_months), '%Y-%m')
        for tracker, month in self.df.groupby('tracker').month.min().iteritems():
            if tracker in self.info:
                self.info[tracker]['date_range'] = [datetime.strptime(month, '%Y-%m'), last_month]


    # Summary methods across all trackers
    # -----------------------------------

    def summary_stats(self):
        """
        Returns: Summary stats across all trackers.

        """
        # snapshot of last month in the data
        ss = self.get_snapshot()
        return {
            'count': len(ss),
            'gt01': len(ss[ss.reach > 0.001]),
            'by_cookies': len(ss[ss.cookies > 0.2]) / len(ss),
            'by_fingerprinting': len(ss[ss.bad_qs > 0.1]) / len(ss),
            'data': ss['content_length'].mean()
        }

    # Methods for a specific Tracker
    # ------------------------------
    def get_tracker(self, id):
        return self.info.get(id)

    def get_name(self, id):
        # TODO: This is odd, are there id-s of trackers that are not in apps?
        return self.info.get(id).get('name') if id in self.info else id

    def get_rank(self, id):
        if id not in self.info:
            raise RuntimeError(f'No tracker with id: {id}')
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
        if 51 <= r < 100:
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
        if self.get_tracker(id).get('overview', {}).get('cookies') > 0.2:
            methods['cookies'] = True
        if self.get_tracker(id).get('overview', {}).get('bad_qs') > 0.1:
            methods['fingerprinting'] = True
        return methods

    def get_reach(self, id):
        tr_df = self.df[self.df.tracker == id].sort_values('month')
        return {
            'page': [reach for reach in tr_df.reach],
            'ts': [datetime.strptime(t, '%Y-%m') for t in tr_df.month],
            'site': [reach for reach in tr_df.site_reach],
        }

    def get_presence_by_site_category(self, id, sites):
        tracker_sites = self.sites.df[self.sites.df.tracker == id].site
        category_counts = sites.df[sites.df.site.isin(tracker_sites)].groupby('category').count().site

        return list((category_counts * 100 / category_counts.sum()).round().sort_values(ascending=False).iteritems())

    def similar_trackers(self, id, n=4):
        """
        Args:
            id: id of tracker for which similar trackers will be found
            n: number of similar trackers to find

        Returns:
            top_n: list of similar trackers, each having an id
                   and the company_id
        """
        st = self.sort_by(metric="reach")
        tracker = self.get_tracker(id)
        return [{
            'id': t.tracker,
            'company_id': t.company_id
        } for t in st[(st.category == tracker['overview']['category']) & (st.tracker != id)][:n].itertuples()]

    def get_domains(self, id):
        return self.get_tracker(id).get('domains', [])

    def iter_sites(self, id):
        for site in self.sites.get_tracker(id).itertuples():
            yield site


class Sites(PandasDataLoader):
    def __init__(self, data_dir, data_months, trackers, region='global'):
        super().__init__(data_dir, data_months, name='sites', region=region)
        self.trackers = trackers

    # Summary methods across all sites
    # --------------------------------

    def summary_stats(self):
        """
        Returns: aggregate tracker statistics across all sites in database

        """
        ss = self.get_snapshot()
        return {
            'count': len(ss),
            "have_trackers": ss.tracked.mean(),
            'gt10': len(ss[ss.trackers >= 10]),
            "average_nr_trackers": ss.trackers.mean(),
            "tracker_requests": int(ss.requests_tracking.mean()),
            'data': ss.content_length.mean()
        }

    # Methods for one specific site
    # -----------------------------
    def get_site(self, id):
        return self.df[self.df.site == id]

    def get_name(self, id):
        # NOTE: This is weird
        return id if len(self.get_site(id)) > 0 else None

    def trackers_on_site(self, id, trackers, companies):
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

        for t in self.trackers.get_site(id).sort_values('site_proportion', ascending=False).itertuples():
            tracker_id = t.tracker
            try:
                tracker = trackers.get_tracker(tracker_id)
                tracker['frequency'] = t.site_proportion
            except TypeError:
                continue
            category = tracker.get('cat', 'unknown')
            if category == 'extensions' or category is None:
                continue

            cid = tracker.get('company_id')
            company_name = companies.get(cid, {}).get('name') or tracker['name']

            yield (tracker, category, company_name)

    def mean_trackers_timeseries(self, id):
        """
        Args:
            id: id, e.g.: ebay.de

        Returns: [(ts0, mean_trackers0, ... ]
        """
        return [(s.get('ts'), s.get('mean_trackers'))
                for s in self.get_site(id).get('history')]


class SitesTrackers(PandasDataLoader):

    def __init__(self, data_dir, data_months, tracker_info, region='global'):
        super().__init__(data_dir, data_months, name='sites_trackers', region=region)

        self.df['company_id'] = pd.Series(
            [tracker_info.get(tracker, {}).get('company_id', tracker)
            for tracker in self.df.tracker], index=self.df.index)

    def get_tracker(self, tracker):
        return self.df[self.df.tracker == tracker]

    def get_site(self, site):
        return self.df[self.df.site == site]

class Companies(PandasDataLoader):

    def __init__(self, data_dir, data_months, company_info, tracker_info, region='global'):
        super().__init__(data_dir, data_months, name='companies', region=region)

        self.df['name'] = pd.Series([
            company_info.get(row.company, tracker_info.get(row.company, {})).get('name', row.company)
            for row in self.df.itertuples()],
            index=self.df.index)
