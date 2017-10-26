title: We built a fully static, lightweight site to make a point about trackers.
subtitle: The journey of adding search, data, plots and blog to 3000 pages of tracker profiles and top domains.
author: no one
type: article
publish: False
date: 2017-07-24
tags: tracker-free, lightweight
header: blog/site.jpg
+++

 
We take privacy very seriously. Over the course of the last two years, 
we have been building a set of privacy-tools, including a state-of-the-art 
[anti-tracking technology](https://static.cliqz.com/wp-content/uploads/2016/07/Cliqz-Studie-Tracking-the-Trackers.pdf)
that uses an algorithmic, data-driven approach to remove unique identifiers 
(UIDs) from third party requests, which we found to perform better than 
the traditional blocklist approach, maximising protection while minimizing 
site breakage. You can read more about it in ['How does Cliqz Anti-tracking work'](/reports/how_cliqz_antitracking_protects_users.html)

We block hundreds of millions of cookies and remove tens of millions of UIDs
per day. This has given us important insights on the tracker landscape.


## Task: Build a site for tracker data
We would be releasing data on the profiles of the [top 1000 trackers](/trackers.html) 
and the companies that own them, and [top 500 domains](/websites.html). 
We quickly realised there was a need for a learning space where we 
explain concepts referred to in the site. This series of primers define 
what we call a [tracker](/learn/what_is_a_tracker.html), 
what [cookies](/learn/cookies.html) and [fingerprinting](learn/fingerprinting.html) 
are and hopefully over time it will become a space for curious readers 
to be introduced to tracking technologies. Then we'd also have a blog 
where we'd be writing about particular trackers, technologies and papers 
and other fun stuff.

Finally, with this site we wanted to also send a message that conveys 
our engineering principle:

> 1. <b>Privacy By Design</b>

In building this site, this meant that we could do everything in 
the client, hence a static site. With these in mind, we would 
build a site with the following properties:

1. Fully Static
2. Data and Visualization centric 
3. Search for the thousands of pages we will be serving
4. No third party trackers
5. Fast


## 1. Generating a static site
We figured for this problem, speed of development and richness of the
ecosystem are very important, so we decided to go with Python. 
Since it's a new project, and we had no dependencies, 
we want with [Python 3.6](https://docs.python.org/3/).

Generating a static site boils down to two important components:

* path management
* templating

This is in no way implying that all there is to a static site generator
are these two, but for our needs, that was the case. 



### 1.1 Path management
There are two parts here. First, having urls to resources and other paths that 
are persistent, and second generate urls dynamically in the templates
for all different entities (e.g.: `trackers`, `websites`, `primers` for learning etc).

The first part is easy, we just store them in a dictionary:

```python

PATHS = {
    "_site": os.path.abspath('_site'),
    "static": '/static',
    ...
}

```
In the templating section, we'll pass this to all templates.


For the second part, we need the `entity` we are generating 
a url for, and the `id` of that entity. 

```python

class DataSource:

    #... complete class definition on github repo where
    # details on the structure of the data is also present

    def url_for(self, entity, id):
        if entity == "tracker":
            return "/trackers/{}.html".format(self.normalize_url(id))
        elif entity == "website":
            return "/websites/{}.html".format(self.get_site_name(id)).lower()
        elif entity == "report":
            return "/reports/{}.html".format(id)
        elif entity == "learn":
            return "/learn/{}.html".format(id)

```


### 1.2. Templating  
The templating engine we choose was [Jinja2](http://jinja.pocoo.org/docs/2.9/).
Jinja features template inheritance which is very useful 
to have reusable components. Although in the docs they 
say python >= 3.3 support is experimental, we found it very 
stable.

We will need from jinja the Environment and a Loader 
[docs](http://jinja.pocoo.org/docs/2.9/api/). As the loader we'll be 
using the `FileSystemLoader`, which loads templates from the file system.

```python
from jinja2 import Environment, FileSystemLoader
```

Now we need a function to render the templates, and pass default jinja
variables that will be shared amongst all templates:

```python
import os


def get_template(data, template_name):
    # data is an instance of DataSource

    env = Environment(
        loader=FileSystemLoader('./templates'),
        autoescape=select_autoescape(['html', 'xml'])
    )

    # adding url_for as a custom flter to the environment object
    env.filters["url_for"] = lambda entity, id: data.url_for(entity, id)

    return env.get_template(template_name)


def render_template(template, **context):
    return template.render(
        PATHS=PATHS,
        **context # template specific object(s)
    )
```

Note: To apply a filter that has two parameters, the syntax is:
`{{ param1|url_for(param2) }}`. For the actual implementation, 
have a look at `./templating.py` in our open 
[github repo](`https://github.com/cliqz-oss/whotracks.me`).



## 2. Data and Vizualization centric
Plotly offline.


## 3. Adding "search"
This is not really search, it's a hack - but it does the job.


## 4. No third party trackers
When working on anti-tracking technologies, among the first things to observe is that a lot
of the trackers in a site are usually  added (un)knowingly through using third party services:

* Content Delivery Networks (CDNs) (e.g: fonts, javascript libraries)
* Analytics
* Site utilities (comments, embedded videos, social media)

To avoid adding trackers unknowingly, it's usually enough to be cautious about these. 
For this site, we decided to host locally libraries that are usually served 
through CDNs. More on the chosen stack in the following sections.


## 5. Fast
Serving the site through CDN.