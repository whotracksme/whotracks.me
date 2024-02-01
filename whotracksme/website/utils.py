import datetime
import simplejson
import pathlib
import os

def myconverter(o):
    if isinstance(o, datetime.datetime):
        return o.isoformat()

def write_json(aPath, **aDict):
    pathlib.Path(os.path.dirname(aPath)).mkdir(parents=True, exist_ok=True)
    jsonString = simplejson.dumps(aDict, indent=2, default = myconverter)
    jsonFile = open(aPath, "w")
    jsonFile.write(jsonString)
    jsonFile.close()

def without_keys(d, keys):
    return {k: d[k] for k in d.keys() - keys}

def print_progress(text, default_space=40):
    print("{} {:{}} done".format(text, "." * (default_space - len(text)), default_space - len(text)))
