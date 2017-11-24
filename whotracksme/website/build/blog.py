
import os
from datetime import datetime
from whotracksme.website.utils import print_progress
from whotracksme.website.templates import (
    render_template,
    get_template,
)


def parse_blogpost(fp):
    with open(fp) as r:
        text = r.read()
    meta, body = text.split('+++')
    title, subtitle, author, post_type, publish, date, tags, header, _ = meta.split("\n")
    return {
        "filename": fp.split("/")[-1].replace(".md", ""),
        "title": title.split(":")[1].strip(),
        "subtitle": subtitle.split(":")[1].strip(),
        "author": author.split(":")[1].strip(),
        "type": post_type.split(":")[1].strip(),
        "publish": eval(publish.split(":")[1].strip()),
        "date": date.split(":")[1].strip(),
        "tags": tags.split(":")[-1].split(","),
        "header_img": header.split(":")[1].strip(),
        "body": body
    }


def load_blog_posts():
    blog_posts = [
        parse_blogpost(os.path.join("blog", f))
        for f in os.listdir("blog/")
    ]
    blog_posts.sort(
        key=lambda p: datetime.strptime(p['date'], '%Y-%m-%d'),
        reverse=True
    )
    return blog_posts


def build_blogpost_list(data, blog_posts):
    with open('_site/blog.html', 'w') as output:
        output.write(render_template(
            template=get_template(data, "blog.html"),
            blog_posts=[p for p in blog_posts if p['publish']]
        ))
    print_progress(text="Generate blog list")


def build_blogpost_pages(data, blog_posts):
    template = get_template(
        data,
        "blog-page.html",
        render_markdown=True,
        path_to_root='..'
    )

    for blog_post in blog_posts:
        with open("_site/blog/{}.html".format(blog_post.get("filename")), 'w') as output:
            output.write(
                render_template(
                    path_to_root='..',
                    template=template,
                    blog_post=blog_post
                )
            )

    print_progress(text="Generate blog posts")
