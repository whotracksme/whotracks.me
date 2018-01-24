
from urllib.parse import quote_plus
from collections import Counter, defaultdict
from statistics import mean
from datetime import datetime
import json
import sqlite3
import pkgutil


def load_asset(name):
    return pkgutil.get_data(
        'whotracksme',
        f'data/assets/{name}'
    ).decode('utf-8')


def load_json_file(name):
    return json.loads(load_asset(name))


def load_tracker_db(loc=':memory:'):
    connection = sqlite3.connect(loc)
    with connection:
        connection.executescript(load_asset('trackerdb.sql'))
    return connection


def load_apps():
    return load_json_file('apps.json')


def load_overview():
    return load_json_file('overview.json')


def load_companies():
    return load_json_file('companies.json')


def load_sites():
    return load_json_file('sites.json')


class DataSource:
    def __init__(self):
        _apps = load_apps()
        _sites = load_sites()
        self.companies = load_companies()
        self.overview = load_overview()

        # Add demographics info to trackers and companies
        connection = load_tracker_db()
        with connection:
            self.app_info = self.load_app_info(connection)
            self.company_info = self.load_company_info(connection)

        for id, app in _apps.items():
            if id in self.app_info:
                for k, v in self.app_info[id].items():
                    app[k] = v
                if not app['name']:
                    app['name'] = id
                if not app['company_id']:
                    app['company_id'] = app['name']
                # added to simplify `Trackers.sort_by()`
                app['overview']['company_id'] = app['company_id']
            else:
                print(f'missing app info for {id}')
                app['name'] = id
                app['company_id'] = 'fill me in'
                app['overview']['company_id'] = 'fill me in'
            if 'cat' not in app:
                print(f'missing category for {id}')
            elif app['cat'] is None:
                print(f'category is none: {id}')
                # app['cat'] = 'unknown'

        # TODO: Remove when supported in data generation
        for id, site in _sites.items():
            site['overview']['category'] = site.get('category', 'unknown')

        for id, company in self.companies.items():
            if id in self.company_info:
                for k, v in self.company_info[id].items():
                    company[k] = v

        self.trackers = Trackers(_apps)
        self.sites = Sites(_sites)

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
            'id', 'name', 'description', 'cat', 'website_url', 'logo_url',
            'company_id'
        ]
        cur = connection.execute(
            '''SELECT trackers.id, trackers.name, description, 
            categories.name, website_url, logo_url, company_id
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
            'id', 'name', 'description', 'about_us_url', 'privacy_contact_url',
            'privacy_url', 'website_url', 'in_their_own_words', 'logo_url'
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


class Trackers:
    def __init__(self, trackers):
        self._trackers = trackers

    # Summary methods across all trackers
    # -----------------------------------
    def iter(self):
        for (tracker_id, tracker) in self._trackers.items():
            yield (tracker_id, tracker)

    def sort_by(self, metric="reach", descending=True):
        """
        Args:
            metric:: string - Shared attribute of trackers to sort by
            descending:: bool

        Returns: list of tracker objects, sorted by metric

        """
        return sorted(
            self._trackers.values(),
            key=lambda a: a['overview'][metric],
            reverse=descending
        )

    def summary_stats(self):
        """
        Returns: Summary stats across all trackers.

        """
        cookies = []
        fingerpriting = []
        data_consumption = []
        for tracker_id, tracker in self._trackers.items():
            cookies.append(
                True if tracker.get('overview', {}).get('cookies') > 0.2
                else False
            )
            fingerpriting.append(
                True if tracker.get('overview', {}).get('bad_qs') > 0.1
                else False
            )
            data_consumption.append(
                tracker.get('overview', {}).get('content_length', 0)
            )

        return {
            'count': len(self._trackers),
            'gt01': len([a for a in self._trackers.values()
                         if a['overview']['reach'] > 0.001]),
            'by_cookies': sum(cookies) / len(cookies),
            'by_fingerprinting': sum(fingerpriting) / len(fingerpriting),
            'data': mean(data_consumption)
        }

    # Methods for a specific Tracker
    # ------------------------------
    def get_tracker(self, id):
        return self._trackers.get(id)

    def get_name(self, id):
        # TODO: This is odd, are there id-s of trackers that are not in apps?
        return self._trackers.get(id).get('name') if id in self._trackers else id

    def get_rank(self, id):
        return self.get_tracker(id).get('rank')

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
        reach = defaultdict(list)

        for t in self._trackers.get(id).get('history'):
            reach['page'].append(t.get('reach'))
            reach['ts'].append(t.get('ts'))
            reach['site'].append(t.get('site_reach'))

        reach['ts'] = [datetime.strptime(t, '%Y-%m') for t in reach['ts']]
        return reach

    def get_presence_by_site_category(self, id, sites):
        categories = Counter(
            filter(
                lambda c: len(c) > 0,
                [sites.get_site(s['site']).get('category', '')
                 for s in self._trackers.get(id).get('sites')]
            )
        )

        if categories.items():
            normalized_categories = []
            total = sum(categories.values())
            for (k, v) in categories.items():
                if not k == '':
                    normalized_categories.append(
                        (k, round(100 * (v / float(total))))
                    )

            return sorted(
                normalized_categories,
                key=lambda x: x[1],
                reverse=True
            )
        return []

    def similar_trackers(self, id, n=4):
        """
        Args:
            id: id of tracker for which similar trackers will be found
            n: number of similar trackers to find

        Returns:
            top_n: list of similar trackers, each having an id
                   and the company_id
        """
        sorted_trackers = self.sort_by(metric="reach")
        tracker = self._trackers.get(id)
        top_n = []

        for t in sorted_trackers:
            if len(top_n) > n:
                break
            similar_tracker = {}

            if t.get('cat') == tracker.get('cat') and \
                    t.get('overview', {}).get('id') != tracker.get('id'):
                similar_tracker['id'] = t['overview']['id']
                similar_tracker['company_id'] = t['company_id']
                top_n.append(similar_tracker)

        return top_n

    def iter_sites(self, id):
        for site in self._trackers.get(id).get('sites', []):
            yield site


class Sites:
    def __init__(self, sites):
        self._sites = sites

    # Summary methods across all sites
    # --------------------------------
    def iter(self):
        for (site_id, site) in self._sites.items():
            yield (site_id, site)

    def sort_by(self, metric='popularity', descending=True):
        return sorted(
            self._sites.values(),
            key=lambda s: s['overview'][metric],
            reverse=descending
        )

    def summary_stats(self):
        """
        Returns: aggregate tracker statistics across all sites in database

        """
        have_trackers = []
        average_nr_trackers = []
        tracker_requests = []
        data_consumption = []
        gt10 = 0
        for (_, site) in self.iter():
            have_trackers.append(site['overview']['tracked'])
            average_nr_trackers.append(site['overview']['mean_trackers'])
            if site['overview']['mean_trackers'] >= 10:
                gt10 += 1
            data_consumption.append(site['overview']['content_length'])
            tracker_requests.append(site["overview"]["requests_tracking"])
        return {
            'count': len(self._sites),
            "have_trackers": mean(have_trackers),
            'gt10': gt10,
            "average_nr_trackers": mean(average_nr_trackers),
            "tracker_requests": int(mean(tracker_requests)),
            'data': mean(data_consumption)
        }

    # Methods for one specific site
    # -----------------------------
    def get_site(self, id):
        return self._sites.get(id, {})

    def get_name(self, id):
        # NOTE: This is weird
        return id if id in self._sites else None

    def tracking_methods(self, id):
        """
        Args:
            id: id of site to access, the site's url

        Returns: {'cookies:: bool, 'fingerprinting':: bool}
                based on chosen threshold by privacy team.

        """
        methods = {
            "cookies": False,
            "fingerprinting": False
        }
        if self.get_site(id).get("overview", {}).get("cookies") > 0.2:
            methods["cookies"] = True
        if self.get_site(id).get("overview", {}).get("bad_qs") > 0.1:
            methods["fingerprinting"] = True
        return methods

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

        for t in self.get_site(id).get('apps'):
            tracker_id = t['app']
            try:
                tracker = trackers.get_tracker(tracker_id)
                tracker['frequency'] = t['frequency']
            except TypeError:
                continue
            category = tracker.get('cat', 'unknown')
            if category == 'extensions':
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
