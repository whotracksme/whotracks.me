
from urllib.parse import quote_plus
from collections import Counter
from statistics import mean
import datetime
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

        # TODO: Temporary, to remove when the data generation
        for id, site in _sites.items():
            site['overview']['category'] = site.get('category', 'misc')

        for id, company in self.companies.items():
            if id in self.company_info:
                for k, v in self.company_info[id].items():
                    company[k] = v

        # TODO: Remove comment when refactoring is done
        self.apps = Trackers(_apps)
        self.sites = Sites(_sites)


    @staticmethod
    def normalize_url(url_substring):
        return quote_plus(url_substring.replace('/', ' ')).lower()

    def url_for(self, entity, id, path_to_root='.'):
        if entity == 'app':
            return '{}/trackers/{}.html'.format(path_to_root, self.normalize_url(id))
        elif entity == 'company':
            return '{}/companies/{}.html'.format(path_to_root, self.normalize_url(id))
        elif entity == 'site':
            return '{}/websites/{}.html'.format(path_to_root, self.sites.get_name(id)).lower()
        elif entity == 'blog':
            return '{}/blog/{}.html'.format(path_to_root, id)

    def get_company_name(self, id):
        return self.company_info.get(id).get('name') if id in self.company_info else id

    def load_app_info(self, connection):
        col_names = ['id', 'name', 'description', 'cat', 'website_url', 'logo_url', 'company_id']
        cur = connection.execute('''SELECT trackers.id, trackers.name, description, categories.name, website_url, logo_url,
                company_id
            FROM trackers
            LEFT JOIN categories ON categories.id = category_id
            ''')
        app_info = {}
        for row in cur:
            app_info[row[0]] = {col: row[i] for i, col in enumerate(col_names)}
            app_info[row[0]]['domains'] = []

        cur = connection.execute('SELECT tracker, domain FROM tracker_domains')
        for app, domain in cur:
            app_info[app]['domains'].append(domain)

        return app_info

    def load_company_info(self, connection):
        col_names = ['id', 'name', 'description', 'about_us_url', 'privacy_contact_url', 'privacy_url', 'website_url',
                     'in_their_own_words', 'logo_url']
        cur = connection.execute('''SELECT {}
            FROM companies
            '''.format(','.join(col_names)))
        company_info = {}
        for row in cur:
            company_info[row[0]] = {col: row[i] for i, col in enumerate(col_names)}
            company_info[row[0]]['apps'] = {}

        cur = connection.execute('SELECT company_id, id, name FROM trackers WHERE company_id IS NOT NULL')
        for cid, app_id, app_name in cur:
            company_info[cid]['apps'][app_id] = app_name

        return company_info


class Trackers:
    def __init__(self, apps):
        self._apps = apps

    # Summary methods accross all trackers
    def iter(self):
        'TODO:  Rethink if overwriting iter or doit elsewhere'
        for (tracker_id, tracker) in self._apps.items():
            yield (tracker_id, tracker)

    def sort_by_prevalence(self):
        return sorted(self._apps.values(), key=lambda a: a['overview']['reach'], reverse=True)

    def sort_by_company(self):
        return sorted(
            self._apps.values(),
            key=lambda a: self.get_name(
                a['overview']['id']) if (
                    'company_id' not in a or
                    a['company_id'] in [None, 'None'])
            else a['company_id']
        )
    
    def summary_stats(self):
        cookies = []
        fingerpriting = []
        data_consumption = []
        for tracker_id, tracker in self._apps.items():
            cookies.append(True if tracker.get('overview', {}).get('cookies') > 0.2 else False)
            fingerpriting.append(True if tracker.get('overview', {}).get('bad_qs') > 0.1 else False)
            data_consumption.append(tracker.get('overview', {}).get('content_length', 0))

        return {
            'count': len(self._apps),
            'gt01': len([a for a in self._apps.values() if a['overview']['reach'] > 0.001]),
            'by_cookies': sum(cookies)/len(cookies),
            'by_fingerprinting': sum(fingerpriting)/len(fingerpriting),
            'data': mean(data_consumption)
        }

    # Methods for a specific Tracker
    def get_tracker(self, id):
        return self._apps.get(id)

    def get_name(self, id):
        # TODO: This is odd, are there id-s of trackers that are not in apps?
        return self._apps.get(id).get('name') if id in self._apps else id

    def get_rank(self, id):
        return self.get_tracker(id).get('rank')

    def get_rank_label(self, id):
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
        # Thresholding values to booleans
        methods = {
            'cookies': False,
            'fingerprinting': False
        }
        if self._apps.get(id).get('overview', {}).get('cookies') > 0.2:
            methods['cookies'] = True
        if self._apps.get(id).get('overview', {}).get('bad_qs') > 0.1:
            methods['fingerprinting'] = True
        return methods

    def get_reach(self, id):
        reach = {
            'ts': [],
            'page': [],
            'site': []
        }

        for t in self._apps.get(id).get('history'):
            reach['page'].append(t.get('reach'))
            reach['ts'].append(t.get('ts'))
            reach['site'].append(t.get('site_reach'))

        # Make dates valid
        reach['ts'] = [datetime.datetime.strptime(t, '%Y-%m') for t in reach['ts']]
        return reach

    def get_presence_by_site_category(self, id, sites):
        categories = Counter(
            filter(lambda c: len(c) > 0, [sites.get_site(s['site']).get('category', '') 
            for s in self._apps.get(id).get('sites')])
        )

        if categories.items():
            normalized_categories = []
            total = sum(categories.values())
            for (k, v) in categories.items():
                if not k == '':
                    normalized_categories.append((k, round(100 * (v / float(total)))))

            return sorted(normalized_categories, key=lambda x: x[1], reverse=True)
        return []

    def similar_trackers(self, id, n=4):
        '''
        Args:
            id: id of tracker for which similar trackers will be found
            n: number of similar trackers to find

        Returns: 
            top_n: list of similar trackers, each having an id 
                   and the company_id
        '''
        sorted_trackers = self.sort_by_prevalence()
        tracker = self._apps.get(id)
        top_n = []

        for t in sorted_trackers:
            if len(top_n) > n:
                break
            similar_tracker = {}

            if t.get('cat') == tracker.get('cat') and t.get('overview', {}).get('id') != tracker.get('id'):
                similar_tracker['id'] = t['overview']['id']
                similar_tracker['company_id'] = t['company_id']
                top_n.append(similar_tracker)

        return top_n

    def iter_sites(self, id):
        for site in self._apps.get(id).get('sites', []):
            yield site


class Sites:
    def __init__(self, sites):
        self._sites = sites

    # Summary methods accross all sites
    def iter(self):
        'TODO:  Rethink if overwriting iter or doit elsewhere'
        for (site_id, site) in self._sites.items():
            yield (site_id, site)

    def sort_by(self, metric='popularity', descending=True):
        return sorted(self._sites.values(), key=lambda s: s['overview'][metric], reverse=descending)

    def summary_stats(self):
        have_trackers = []
        average_nr_trackers = []
        tracker_requests = []
        data_consumption = []
        gt10 = 0
        for (site_id, site) in self.iter():
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
    def get_site(self, site):
        return self._sites.get(site, {})

    def get_name(self, site_id):
        # NOTE: THis is weird
        return site_id if site_id in self._sites else None

    def tracking_methods(self, site):
        # Thresholding values to booleans
        methods = {
            "cookies": False,
            "fingerprinting": False
        }
        if self.get_site(site).get("overview", {}).get("cookies") > 0.2:
            methods["cookies"] = True
        if self.get_site(site).get("overview", {}).get("bad_qs") > 0.1:
            methods["fingerprinting"] = True
        return methods

    def trackers_on_site(self, site, trackers, companies):
        '''
        Args:
            site: a site dict from self.sites

        Returns: 
            tracker :: dict,
            category :: string,
            company_name :: string)
        '''

        for t in site.get('apps'):
            tracker_id = t['app']
            try:
                tracker = trackers.get_tracker(tracker_id)
                tracker['frequency'] = t['frequency']
            except:
                continue
            # TODO: remove, should have been handled when loading trackers
            if 'name' not in tracker:
                tracker['name'] = tracker_id
            category = tracker.get('cat', 'unknown')
            if category == 'extensions':
                continue

            company_id = tracker.get('company_id')
            company_name = companies.get(company_id, {}).get('name') or tracker['name']

            yield tracker, category, company_name

