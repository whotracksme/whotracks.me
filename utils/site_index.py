from collections import defaultdict


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
