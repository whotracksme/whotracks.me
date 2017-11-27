import json


def print_progress(text, default_space=40):
    print("{} {:{}} done".format(text, "." * (default_space - len(text)), default_space - len(text)))


def og_snippet(page):
    with open('text_content/og_snippets.json', 'r') as snippets:
        return json.loads(snippets).get(page)