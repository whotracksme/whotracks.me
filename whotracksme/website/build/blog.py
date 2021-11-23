import os
import calendar
from datetime import datetime
from whotracksme.data.loader import DataSource
from whotracksme.website.utils import print_progress
from whotracksme.website.templates import render_template, get_template
from feedgen.feed import FeedGenerator
from pytz import timezone


def parse_blogpost(filepath):
    with open(filepath) as r:
        text = r.read()
    meta, body = text.split("+++")
    title, subtitle, author, post_type, publish, date, tags, header, _ = meta.split(
        "\n"
    )
    return {
        "filename": filepath.split("/")[-1].replace(".md", ""),
        "title": title.split(":")[1].strip(),
        "subtitle": subtitle.split(":")[1].strip(),
        "author": author.split(":")[1].strip().capitalize(),
        "type": post_type.split(":")[1].strip(),
        "publish": bool(publish.split(":")[1].strip() == "True"),
        "date": date.split(":")[1].strip(),
        "repr_date": get_human_date(date.split(":")[1].strip()),
        "tags": tags.split(":")[-1].split(","),
        "header_img": header.split(":")[1].strip(),
        "body": body,
    }


def load_blog_posts():
    blog_posts = [parse_blogpost(os.path.join("blog", f)) for f in os.listdir("blog/")]
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
