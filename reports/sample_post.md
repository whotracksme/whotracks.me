title: This is a random title
subtitle: An inquiry into the efficiency of random subtitles to making a point about design. 
author: Privacy Knight
type: article
publish: False
date: 2017-07-22
tags: privacy, circle
header: 
+++


Privacy is the ability of an individual or group to seclude themselves, or information about themselves, and thereby express themselves selectively. The boundaries and content of what is considered private differ among cultures and individuals, but share common themes. When something is private to a person, it usually means that something is inherently special or sensitive to them. The domain of privacy partially overlaps security (confidentiality), which can include the concepts of appropriate use, as well as protection of information. Privacy may also take the form of bodily integrity.

The right not to be subjected to unsanctioned invasion of privacy by the government, corporations or individuals is part of many countries' privacy laws, and in some cases, constitutions. Almost all countries have laws which in some way limit privacy. An example of this would be law concerning taxation, which normally require the sharing of information about personal income or earnings. In some countries individual privacy may conflict with freedom of speech laws and some laws may require public disclosure of information which would be considered private in other countries and cultures.


#### Californication
> "Space may be the final frontier. But it's made in a Hollywood basement"

And `code snippets` are rendered properly. Looks alright.


Paragraphs are separated by a blank line.

2nd paragraph. *Italic*, **bold**, and `monospace`. Itemized lists
look like:

  * this one
  * that one
  * the other one

Here's a numbered list:

 1. first item
 2. second item
 3. third item


As you probably guessed, indented 4 spaces. By the way, instead of
indenting the block, you can use delimited blocks (which makes copying & pasting easier). You can optionally mark the
delimited block for Pandoc to syntax highlight it:

```
def companies_present(companies, apps, site):
    trackers = site.get("apps")
    
    node_label = []
    link_source = []
    link_target = []
    link_value = []
    link_label = []

    for t in trackers:
        app_id = t["app"]
        try:
            app = apps[app_id]
        except:
            pass

        if 'name' not in app:
            app['name'] = app_id
        tracker_name = app["name"]
        category = app.get("cat", 'other')
        company_id = app.get("owner")
        parent_id = get_company(companies, company_id).get("parent_company")
        if parent_id != "None":
            company = get_company(companies, parent_id).get("name")
        else:
            company = get_company(companies, company_id).get("name")

        # TODO: This must be simpler
        if (company is not None or eval(str(company)) is not None) and (category is not None or eval(str(category)) is not None):
            if category in node_label:
                c_idx = node_label.index(category)
            else:
                node_label.append(category)
                c_idx = len(node_label) - 1
            if company in node_label:
                com_idx = node_label.index(company)
            else:
                node_label.append(company)
                com_idx = len(node_label) - 1
            link_source.append(c_idx)
            link_target.append(com_idx)
            link_label.append(tracker_name)
            link_value.append(100.0 * t["frequency"])

    return {
        "node": {
            "label": node_label,
            "color": [random_color() for _ in range(len(node_label))]
        },
        "link": {
            "source": link_source,
            "target": link_target,
            "value": link_value,
            "label": link_label,
            "color": ["rgba(227, 163, 43, 0.2)"] * len(link_label)

        }
    }

```
