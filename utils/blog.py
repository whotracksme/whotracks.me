def parse(fp):
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
