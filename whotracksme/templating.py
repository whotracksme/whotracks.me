from urllib.parse import quote_plus
import os
import shutil
import subprocess

from jinja2 import Environment, FileSystemLoader, Markup
import markdown


from whotracksme.db.trackerdb import load_tracker_db
from whotracksme.plotting.colors import TrackerColors, SiteCategoryColors


# Paths needed for generating urls
SITE_PATH = os.path.abspath('_site')
PATHS = {
    "_site": SITE_PATH,
    "static": '/static',
    "trackers": '/trackers',
    "websites": '/websites',
    "companies": '/companies',
    "blog": '/blog',
}

CATEGORY_DESC = {
    "advertising": "Provides advertising or advertising-related services such as data collection, behavioral analysis or retargeting.",
    "comments": "Enables comments sections for articles and product reviews.",
    "customer_interaction": "Includes chat, email messaging, customer support, and other interaction tools.",
    "essential": "Includes tag managers, privacy notices, and technologies that are critical to the functionality of a website.",
    "adult_advertsing": "Delivers advertisements that generally appear on adult content sites.",
    "site_analytics": "Collects and analyzes data related to site usage and performance.",
    "social_media": "Integrates features related to social media sites.",
    "audio_video_player": "Enables websites to publish, distribute, and optimize video and audio content.",
    "cdn":  "Content delivery network that delivers resources for different site utilies and usually for many different customers.",
    "misc": "This tracker does not fit in other categories or has not yet been labelled.",
    "pornvertising": "Delivers advertisements that generally appear on adult content sites.",
    "hosting": "This is a service used by the content provider or site owner.",
    "extensions": "This are browser addons that collect user data"
}


class DataSource:
    def __init__(self, overview, apps, companies, sites):
        self.overview = overview
        self.apps = apps
        self.companies = companies
        self.sites = sites

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

    def url_for(self, entity, id, path_to_root='.'):
        if entity == "app":
            return "{}/trackers/{}.html".format(path_to_root, self.normalize_url(id))
        elif entity == "company":
            return "{}/companies/{}.html".format(path_to_root, self.normalize_url(id))
        elif entity == "site":
            return "{}/websites/{}.html".format(path_to_root, self.get_site_name(id)).lower()
        elif entity == "blog":
            return "{}/blog/{}.html".format(path_to_root, id)

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


def get_template(data_source, name, render_markdown=False, path_to_root='.'):
    env = Environment(loader=FileSystemLoader('./templates'))

    if render_markdown:
        md = markdown.Markdown(
            extensions=[
                'meta',
                'fenced_code',
                'extra',
                'toc',
                'def_list'
            ]
        )
        env.filters["markdown"] = lambda text: Markup(md.convert(text))
    env.filters["prettify_label"] = lambda text: text.replace("_", " ").capitalize() if text not in [None, "None", ""] else ""
    env.filters["normalize_domain_name"] = lambda text: text.replace("www.", "")
    env.filters["url_for"] = lambda entity, id: data_source.url_for(entity, id, path_to_root=path_to_root)
    env.filters["get_app_name"] = lambda id: data_source.get_app_name(id)
    env.filters["get_company_name"] = lambda id: data_source.get_company_name(id)
    env.filters["get_site_name"] = lambda id: data_source.get_site_name(id)

    env.filters["b_to_mb"] = lambda b: round(b / 10**6, 1)
    env.filters["round2"] = lambda x: round(x, 1)
    env.filters["percentage"] = lambda x, y: round((x / y) * 100, 1)
    env.filters["to_percentage"] = lambda x: round(x*100, 1)
    env.filters["rank_label"] = lambda r: data_source.rank_label(r)
    return env.get_template(name)


def render_template(template, path_to_root='.', **context):
    """
    :param template: Jinja2 template to be rendered
    :param context: The variables that should be available in the
                    context of the template.
    :return: populated template
    """
    paths = {k: path_to_root + path for k, path in PATHS.items()}
    paths['path_to_root'] = path_to_root
    return template.render(
        PATHS=paths,
        TRACKER_CATEGORIES=TrackerColors,
        SITE_CATEGORIES=SiteCategoryColors,
        CATEGORY_DESC=CATEGORY_DESC,
        **context
    )


def compile_scss_to_css(scss_folder, css_folder):
    subprocess.run(["sass", "--update", "%s:%s"% (scss_folder, css_folder)])


def create_site_structure(static_path):
    """
    :return:
        _site/
            trackers/
                <...>.html
            websites/
                <...>.html
            companies/
                <...>.html
            blog/
                <...>.html
            static/
                <...>

    """
    if not os.path.exists('data'):
        os.mkdir('data')
    if not os.path.exists(PATHS.get('_site')):
        os.mkdir(PATHS.get("_site"))
    if not os.path.exists(os.path.join(SITE_PATH, PATHS.get("trackers")[1:])):
        os.mkdir(os.path.join(SITE_PATH, PATHS.get("trackers")[1:]))
    if not os.path.exists(os.path.join(SITE_PATH, PATHS.get("websites")[1:])):
        os.mkdir(os.path.join(SITE_PATH, PATHS.get("websites")[1:]))
    if not os.path.exists(os.path.join(SITE_PATH, PATHS.get("companies")[1:])):
        os.mkdir(os.path.join(SITE_PATH, PATHS.get("companies")[1:]))
    if not os.path.exists(os.path.join(SITE_PATH, PATHS.get("blog")[1:])):
        os.mkdir(os.path.join(SITE_PATH, PATHS.get("blog")[1:]))

    # compile scss to css
    scss_folder = os.path.join(static_path, "scss")
    css_folder = os.path.join(static_path, "css")
    compile_scss_to_css(scss_folder, css_folder)

    # Copy static folder inside _site/ (if not there already)
    _site_static = os.path.join(SITE_PATH, "static")
    if os.path.exists(_site_static):
        shutil.rmtree(_site_static)
        shutil.copytree(static_path, _site_static)
    elif not os.path.exists(_site_static):
        shutil.copytree(static_path, _site_static)

