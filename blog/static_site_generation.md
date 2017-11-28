title: Building whotracks.me - Generating a static site (part 1)
subtitle: Adding search, data, plots and blog to 1000+ pages of tracker profiles and top domains.
author: no one
type: article
publish: False
date: 2017-11-02
tags: tracker-free, lightweight
header_img: blog/blog-site-p1.png
+++


## 1. Generating a static site
We figured that, for this problem, speed of development and richness of the
ecosystem are very important, so we decided to go with Python. 
Since it's a new project, and we had no dependencies, 
we decided for [Python 3.6](https://docs.python.org/3.6/).

Generating a static site boils down to two important components:

* Path management
* Templates

This is in no way implying that all there is to a static site generator
are these two, but for our needs, that was the case.
Both of these are defined in [`templating.py`](https://github.com/cliqz-oss/whotracks.me/blob/master/templating.py).


### 1.1 Path management
There are two parts here. First, generating urls for shared 
resources (i.e. `static`, `shared data` etc), 
and second generating urls dynamically in the templates
for all different entities (e.g.: `trackers`, `websites`, 
`primers` for learning etc).

The first part is easy, we just store the paths of the 
shared resources in a dictionary, which we will later pass
to the template rendering function as persistent context:

```python
import os


PATHS = {
    "_site": os.path.abspath('_site'),
    "static": '/static',
    ...
}

```

For the second part, we need the `entity` we are generating 
a url for, and the `id` of that entity. 

```python
from urllib.parse import quote_plus


class DataSource:
    #... complete class definition on github repo where
    # details on the structure of the data is also present

    @staticmethod
    def normalize_url(url_substring):
        return quote_plus(url_substring.replace("/", " ")).lower()

    def url_for(self, entity, id):
        if entity == "tracker":
            return "/trackers/{}.html".format(self.normalize_url(id))
        elif entity == "website":
            return "/websites/{}.html".format(self.get_site_name(id)).lower()
        elif entity == "report":
            return "/reports/{}.html".format(id)
```

We use [quote_plus](https://docs.python.org/3.6/library/urllib.parse.html#url-quoting) 
here to make sure we get properly formatted urls. This 
is very useful to avoid errors in generating urls for entities whose id
would cause issues such as `[24]7`, which is a 
[tracker](https://whotracks.me/trackers/24_7.html).


### 1.2. Templating
The templating engine we choose was [Jinja2](http://jinja.pocoo.org/docs/2.9/).
Jinja features template inheritance which is very 
useful for having reusable components. Although in 
the docs they say `python >= 3.3` support is 
experimental, we found it very stable.

We'll be using the `Environment` object from jinja 
to load templates and `FileSystemLoader` as the 
loader [docs](http://jinja.pocoo.org/docs/2.9/api/)
of choice to load templates from the file system.

```python
from jinja2 import Environment, FileSystemLoader
```

Now we need a function to render the templates, and 
pass default jinja variables that will be shared 
amongst all templates:

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

The documentation on [filters in jinja](http://jinja.pocoo.org/docs/2.9/api/#writing-filters) 
can be found here. Note how we registered a filter 
in the environment. This is very useful and we use 
this extensively in [`templating.py#L137`](https://github.com/cliqz-oss/whotracks.me/blob/master/templating.py#L137).



### 1.3. Building a static page

In this section, we'll use the functions defined 
above to build a simple tracker page.

```python
from templating.py import DataSource, get_template, render_template


def build_tracker_page(data, tracker):
    # data is an instance of DataSource
    # tracker is a dictionary that holds
    # .. information on a given tracker

    template = get_template(data, "tracker-page.html")

    content = render_template(
        template=template,
        tracker=tracker      
    )

    with open('{}'.format(data.url_for('tracker', tracker["id"])), 'w') as fp:
        fp.write(content)
        return
```

All the templates are defined in [`./templates`](https://github.com/cliqz-oss/whotracks.me/tree/master/templates).
So in that folder, we must have a `tracker-page.html` 
template that could look like this: 

```html
{% extends "base.html" %}

{% block content %}
<div>
    <a href="{{ 'tracker'|url_for(tracker.id) }}">{ tracker.name }}</a>
</div>
{% endblock %}

```
We have a [`base.html`](https://github.com/cliqz-oss/whotracks.me/blob/master/templates/base.html) 
where we define the shared html structure with all stylesheets 
and scripts. Inside the `body` in this base we declare a content block, 
which we will be populating in other templates 
(see [`base.html#L51`](https://github.com/cliqz-oss/whotracks.me/blob/master/templates/base.html#L51)).

So now in our `tracker-page.html` template we simply extend 
base and start populating the content block, which in our 
case has the tracker name with a link to its profile. 
Note that this is to simply show how we can access the 
`tracker` dictionary passed to `render_template()` and the 
custom filter `url_for` registered earlier in `get_template()`.
The actual function for building tracker-pages is defined in 
[`buildsite.py#L120`](https://github.com/cliqz-oss/whotracks.me/blob/master/buildsite.py#L120)
while the template for tracker pages like [this one](/trackers/criteo.html) 
is defined here [`tracker-page.html`](https://github.com/cliqz-oss/whotracks.me/blob/master/templates/tracker-page.html).


## Relevant files
Do not forget to check the our [repository on github](https://github.com/cliqz-oss/whotracks.me) 
for the actual implementation and more details. 
Relevant files are:

- [`buildsite.py`](https://github.com/cliqz-oss/whotracks.me/tree/master/buildsite.py): entry point for building pages
- [`templating.py`](https://github.com/cliqz-oss/whotracks.me/tree/master/templating.py): handles the templating and path management (discussed here)
- [`templates/`](https://github.com/cliqz-oss/whotracks.me/tree/master/templates) : Where all html templates and components are defined