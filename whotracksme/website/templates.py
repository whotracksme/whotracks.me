from collections import defaultdict
import json
import os
import shutil
import subprocess
from datetime import date
from pathlib import Path

from jinja2 import Environment, FileSystemLoader, Markup
import markdown
import sass


from whotracksme.website.utils import print_progress
from whotracksme.website.plotting.colors import (
    tracker_category_colors, site_category_colors
)


def site_to_json(data_source, blog_posts):
    site_idx = defaultdict(list)

    def submit_key(name, type, url, weight, idx=site_idx):
        _name = name.lower()
        idx[type].append({
            "name": name,
            "normalized_name": _name,
            "type": type,
            "url": url,
            "weight": weight
        })

    for tracker in data_source.trackers.get_snapshot().itertuples():
        submit_key(
            name=data_source.trackers.get_name(tracker.tracker),
            type="tracker",
            url=data_source.url_for("tracker", tracker.tracker),
            weight=(1.0 / tracker.reach_rank) * 1000
        )
        # Search a tracker by domain.
        for d in data_source.trackers.get_domains(tracker.tracker):
            submit_key(
                name=d,
                type="tracker",
                url=data_source.url_for("tracker", tracker.tracker),
                weight=(1.0 / tracker.reach_rank) * 1000
            )

    for company in data_source.companies.get_snapshot().itertuples():
        submit_key(
            name=company.name,
            type="company",
            url=data_source.url_for("company", company.company),
            weight=len(data_source.trackers.df[data_source.trackers.df.company_id == company.company]) or 1
        )

    for site in data_source.sites.get_snapshot().itertuples():
        submit_key(
            name=site.site,
            type="site",
            url=data_source.url_for("site", site.site),
            weight=site.popularity * 10000
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
SITE_PATH = Path('_site').absolute().as_posix()
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
    "extensions": "These are browser addons that collect user data"
}


def copy_custom_error_pages(data):
    error_pages = {
        "not-found": get_template(data, "not-found.html",  path_to_root=''),
        "tracker-not-found": get_template(data, "tracker-not-found.html", path_to_root=''),
        "website-not-found": get_template(data, "website-not-found.html", path_to_root='')
    }

    for error, template in error_pages.items():
        with open('_site/{}.html'.format(error), 'w') as output:
            output.write(render_template(template=template, path_to_root=''))


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
    env.filters["prettify_label"] = \
        lambda text: " ".join(map(lambda x: x.capitalize(), text.split("_"))) \
        if text not in [None, "None", ""] else ""
    env.filters["normalize_domain_name"] = lambda text: text.replace("www.", "")
    env.filters["absolute_og_urls"] = lambda url: url.replace("../", "").replace("./", "")
    env.filters["url_for"] = \
        lambda entity, id: data_source.url_for(entity, id, path_to_root=path_to_root)
    env.filters["get_app_name"] = lambda id: data_source.trackers.get_name(id)
    env.filters["get_company_name"] = lambda id: data_source.get_company_name(id)
    env.filters["get_site_name"] = lambda id: data_source.sites.get_name(id)

    env.filters["b_to_mb"] = lambda b: round(b / 10 ** 6, 1)
    env.filters["round2"] = lambda x: round(x, 1)
    env.filters["percentage"] = lambda x, y: round((x / y) * 100, 1)
    env.filters["to_percentage"] = lambda x: round(x * 100, 1)
    env.filters["rank_label"] = lambda id: data_source.trackers.get_rank_label(id)
    return env.get_template(name)


def render_template(template, path_to_root='.', **context):
    """
    Args:
        template: Jinja2 template to be rendered
        path_to_root: to have relative paths
        **context: Available variables in template.

    Returns: populated template
    """
    paths = {k: path_to_root + path for k, path in PATHS.items()}
    paths['path_to_root'] = path_to_root
    return template.render(
        PATHS=paths,
        TRACKER_CATEGORIES=tracker_category_colors,
        SITE_CATEGORIES=site_category_colors,
        CATEGORY_DESC=CATEGORY_DESC,
        TODAY=date.today().strftime('%d.%m.%Y'),
        **context
    )


def create_site_structure(static_path):
    """
    Args:
        static_path: path to static folder

    Returns: rendered site ready to publish (_site)
    """
    def ensure_dir_exists(entry):
        if not entry.exists():
            entry.mkdir()

    # data = Path("data")
    # ensure_dir_exists(data)

    _site = Path(PATHS.get("_site"))
    ensure_dir_exists(_site)

    trackers = _site.joinpath('trackers')
    ensure_dir_exists(trackers)

    websites = _site.joinpath('websites')
    ensure_dir_exists(websites)

    companies = _site.joinpath('companies')
    ensure_dir_exists(companies)

    blog = _site.joinpath('blog')
    ensure_dir_exists(blog)

    # Copy static folder inside _site/ (if not there already)
    _site_static = _site.joinpath('static')
    if _site_static.exists():
        shutil.rmtree(_site_static.as_posix())
        shutil.copytree(static_path, _site_static.as_posix())
    elif not _site_static.exists():
        shutil.copytree(static_path, _site_static.as_posix())

    # compile static/scss directly to _site/static/css
    scss_folder = Path(static_path).joinpath("scss")
    css_folder = _site_static.joinpath("css")
    sass.compile(dirname=(scss_folder, css_folder), output_style='compressed')
