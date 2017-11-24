
from urllib.parse import quote_plus
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
        self.overview = load_overview()
        self.apps = load_apps()
        self.companies = load_companies()
        self.sites = load_sites()

        connection = load_tracker_db()
        with connection:
            self.app_info = self.load_app_info(connection)
            self.company_info = self.load_company_info(connection)

        for id, app in self.apps.items():
            if id in self.app_info:
                for k, v in self.app_info[id].items():
                    app[k] = v

        for id, company in self.companies.items():
            if id in self.company_info:
                for k, v in self.company_info[id].items():
                    company[k] = v

    @staticmethod
    def normalize_url(url_substring):
        return quote_plus(url_substring.replace("/", " ")).lower()

    def url_for(self, entity, id, path_to_root='.'):
        if entity == "app":
            return "{}/trackers/{}.html".format(path_to_root, self.normalize_url(id))
        elif entity == "company":
            return "{}/companies/{}.html".format(path_to_root, self.normalize_url(id))
        elif entity == "site":
            return "{}/websites/{}.html".format(path_to_root, self.get_site_name(id)).lower()
        elif entity == "blog":
            return "{}/blog/{}.html".format(path_to_root, id)

    @staticmethod
    def rank_label(r):
        if r < 3:
            return "Dangerously prevalent"
        if 3 <= r < 11:
            return "Extremely prevalent"
        if 11 <= r < 50:
            return "Very prevalent"
        if 51 <= r < 100:
            return "Commonly prevalent"
        if 101 <= r:
            return "Relatively prevalent"

    def get_app_name(self, id):
        return self.app_info.get(id).get('name') if id in self.app_info else id

    def get_company_name(self, id):
        return self.company_info.get(id).get('name') if id in self.company_info else id

    def get_site_name(self, id):
        return id if id in self.sites else None

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


