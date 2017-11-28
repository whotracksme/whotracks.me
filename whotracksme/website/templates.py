
from collections import defaultdict
import json
import os
import shutil
import subprocess

from jinja2 import Environment, FileSystemLoader, Markup
import markdown

from whotracksme.website.utils import print_progress
from whotracksme.website.plotting.colors import TrackerColors, SiteCategoryColors


def normalize(s):
    # TODO: add other normalization features
    return s.lower()


def site_to_json(data_source, blog_posts):
    site_idx = defaultdict(list)

    def submit_key(name, type, url, weight, idx=site_idx):
        _name = normalize(name)
        idx[type].append({
            "name": name,
            "normalized_name": _name,
            "type": type,
            "url": url,
            "weight": weight
        })

    for app_id, app in data_source.apps.items():
        submit_key(
            name=data_source.get_app_name(app_id),
            type="tracker",
            url=data_source.url_for("app", app_id),
            weight=(1.0 / app.get("rank", 1)) * 1000
        )

    for company_id, company in data_source.companies.items():
        submit_key(
            name=data_source.get_company_name(company_id),
            type="company",
            url=data_source.url_for("company", company_id),
            weight=len(company.get("overview", {}).get("apps", {})) or 1
        )

    for site_id, site in data_source.sites.items():
        submit_key(
            name=data_source.get_site_name(site_id),
            type="site",
            url=data_source.url_for("site", site_id),
            weight=site.get("overview", {}).get("popularity", 0.01) * 10000
        )

    for blogpost in blog_posts:
        submit_key(
            name=blogpost.get("title"),
            type="blog",
            url=data_source.url_for("blog", blogpost.get("filename")),
            weight=1
        )

    return site_idx

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

def copy_custom_error_pages(data):
    error_pages = {
        "not-found": get_template(data, "not-found.html"),
        "tracker-not-found": get_template(data, "tracker-not-found.html"),
        "website-not-found": get_template(data, "website-not-found.html")
    }

    for error, template in error_pages.items():
        with open('_site/{}.html'.format(error), 'w') as output:
            output.write(render_template(template=template))


def generate_sitemap(data, blog_posts):
    # write sitemap to _site (to be used as index for static site search)
    with open("_site/sitemap.json", "w") as output:
        json.dump(
            site_to_json(
                data_source=data,
                blog_posts=blog_posts),
            output
        )
    print_progress(text='Generate sitemap index')


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


    # Copy static folder inside _site/ (if not there already)
    _site_static = os.path.join(SITE_PATH, "static")
    if os.path.exists(_site_static):
        shutil.rmtree(_site_static)
        shutil.copytree(static_path, _site_static)
    elif not os.path.exists(_site_static):
        shutil.copytree(static_path, _site_static)

    # compile static/scss directly to _site/static/css
    scss_folder = os.path.join(static_path, "scss")
    css_folder = os.path.join("_site/static", "css")
    compile_scss_to_css(scss_folder, css_folder)
