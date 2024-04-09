import datetime
import simplejson
import pathlib
import os


def write_json(path, **data):
    def myconverter(o):
        if isinstance(o, datetime.datetime):
            return o.isoformat()

    pathlib.Path(os.path.dirname(path)).mkdir(parents=True, exist_ok=True)
    json = simplejson.dumps(data, indent=2, default=myconverter)
    with open(path, "w", encoding="utf-8") as file:
        file.write(json)


def without_keys(d, keys):
    return {k: d[k] for k in d.keys() - keys}


def print_progress(text, default_space=40):
    print("{} {:{}} done".format(text, "." * (default_space - len(text)), default_space - len(text)))
