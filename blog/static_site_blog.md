title: Building whotracks.me - Blog (part 3)
subtitle: Adding search, data, plots and blog to 1000+ pages of tracker profiles and top domains.
author: privacy team
type: article
publish: True
date: 2017-11-01
tags: blog, markdown
header_img: blog/blog-site-p3.png
+++

In most static site generators, one writes markdown, which is parsed and rendered
into a nice blog post. So how do we do that here. As it turns out, it's pretty
straight forward.

We have two cases here, first the main blog page, where a list of the posts
is presented, and then the post page. For both of these we have 
templates, which can be found at 
[`templates/blog.html`](https://github.com/cliqz-oss/whotracks.me/blob/master/templates/blog.html) and 
[`templates/blog-page.html`](https://github.com/cliqz-oss/whotracks.me/blob/master/templates/blog-page.html)
respectively.

For this, let's write a super simple function to parse the markdown file. To make
its life easy, we specify a given format in the post's markdown that looks like this: 


```md
title: Building whotracks.me - Blog (part 3)
subtitle: Adding search, data, plots and blog to 1000+ pages of tracker profiles and top domains.
author: privacy team
type: article
publish: True
date: 2017-11-01
tags: tracker-free, lightweight
header_img: blog/blog-site-p3.png
➕➕➕

<MARKDOWN BODY>
```

These are all the components we need to render the snippet, and 
the actual blog post. As promised the parsing function is quite simple:

```python
def parse(fp):
    ''' fp: filepath to the markdown file '''
    with open(fp) as r:
        text = r.read() 
    meta, body = text.split('➕➕➕')
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
```

Alright, so now we have a way to parse the markdown to generate all parts that we 
need and the templates to render them, so we are left with styling. There are three 
elements we need to style:

- the blog post card (snippet) 
- the actual post page. 
- the code snippets style

Their styles are respectively defined in: 

- [`static/scss/blog/card.scss`](https://github.com/cliqz-oss/whotracks.me/blob/master/static/scss/blog/card.scss) 
- [`static/scss/post/post.scss`](https://github.com/cliqz-oss/whotracks.me/blob/master/static/scss/blog/post.scss)
- [`static/scss/post/github.scss`](https://github.com/cliqz-oss/whotracks.me/blob/master/static/scss/blog/github.scss)