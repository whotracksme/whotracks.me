import os
import calendar
from datetime import datetime
from whotracksme.data.loader import DataSource
from whotracksme.website.utils import print_progress
from whotracksme.website.templates import render_template, get_template
from feedgen.feed import FeedGenerator
from pytz import timezone

META_TAGS = [
    "title",
    "subtitle",
    "description",
    "author",
    "type",
    "publish",
    "date",
    "tags",
    "header_img",
]

def parse_blogpost(filepath):
    try:
        with open(filepath) as r:
            text = r.read()
            meta_section, body = text.split("+++")

        meta = {}
        for line in meta_section.split("\n"):
            line = line.strip()
            if len(line) > 0:
                key = line.split(":")[0]
                if key not in META_TAGS:
                    raise ValueError(f'Unknown meta tag "{key}". Must be one of {META_TAGS}.')
                meta[key] = line[len(key)+1:].strip()

        # TODO: update all blog post (explictly add the description and then remove this fallback)
        if "description" not in meta:
            print(f'WARN: {filepath}: "description" not defined; falling back to "subtitle")')
            meta["description"] = meta.get("subtitle", "")

        return {
            "filename": filepath.split("/")[-1].replace(".md", ""),
            "title": meta["title"],
            "subtitle": meta.get("subtitle", ""),
            "description": meta.get("description", ""),
            "author": meta.get("author", "").capitalize(),
            "type": meta["type"],
            "publish": bool(meta["publish"] == "True"),
            "date": meta["date"],
            "repr_date": get_human_date(meta["date"]),
            "tags": meta["tags"].split(":")[-1].split(","),
            "header_img": meta["header_img"],
            "body": body,
        }
    except Exception as ex:
        print(f'ERROR: failed to parse blog post {filepath} (details: {ex})')
        raise ex


def load_blog_posts():
    blog_posts = [parse_blogpost(os.path.join("blog", f))
                  for f in os.listdir("blog/")
                  if f.endswith('.md')]
    blog_posts.sort(
        key=lambda p: datetime.strptime(p["date"], "%Y-%m-%d"), reverse=True
    )
    return blog_posts


def build_blogpost_list(data, blog_posts):
    with open("_site/blog.html", "w") as output:
        output.write(
            render_template(
                template=get_template(data, "blog.html"),
                blog_posts=[p for p in blog_posts if p["publish"]],
            )
        )
    print_progress(text="Generate blog list")


def build_blogpost_pages(blog_posts):
    data = DataSource(populate=False)

    for blog_post in blog_posts:
        # TODO: Move template out after footnotes markdown extension does
        # not save global state
        template = get_template(
            data, "blog-page.html", render_markdown=True, path_to_root=".."
        )
        with open(f'_site/blog/{blog_post.get("filename")}.html', "w") as output:
            output.write(
                render_template(
                    path_to_root="..", template=template, blog_post=blog_post
                )
            )

    print_progress(text="Generate blog posts")


def get_human_date(date):
    d = datetime.strptime(date, "%Y-%m-%d")

    if 4 <= d.day <= 20 or 24 <= d.day <= 30:
        suffix = "th"
    else:
        suffix = ["st", "nd", "rd"][d.day % 10 - 1]
    month = calendar.month_abbr[d.month]
    return f"{month} {d.day}{suffix}, {d.year}"


def build_rss_feeds(blog_posts):
    feed = FeedGenerator()
    feed.load_extension("media", rss=True, atom=True)
    base = "https://whotracks.me"

    for post in blog_posts:
        if post["publish"]:
            entry = feed.add_entry()
            entry.id(f'{base}/blog/{post["filename"]}.html')
            entry.title(post["title"])
            entry.link(link={"href": f"{base}/blog/{post['filename']}.html"})
            entry.author({"name": post["author"]})
            entry.pubDate(
                datetime.strptime(post["date"], "%Y-%m-%d").replace(
                    tzinfo=timezone("CET")
                )
            )
            entry.description(post["subtitle"])
            entry.media.thumbnail(
                url=f'https://whotracks.me/static/img/{post["header_img"]}'
            )

    feed.title("WhoTracksMe blog")
    feed.description("By the Ghostery tech team")
    feed.link(link={"href": f"{base}/blog.html"})

    feed.id("wtm")
    feed.language("en")
    feed.logo(f"{base}/static/img/who-tracksme-logo.png")

    feed.rss_file("_site/blog/feed.xml")
