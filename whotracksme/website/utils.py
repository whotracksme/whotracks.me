from datetime import datetime
import json
import pathlib
import os

class DateTimeEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, datetime):
            return o.isoformat()

        return json.JSONEncoder.default(self, o)

def write_json(aPath, aDict):
    pathlib.Path(os.path.dirname(aPath)).mkdir(parents=True, exist_ok=True)
    jsonString = json.dumps(aDict, cls=DateTimeEncoder, indent=2)
    jsonFile = open(aPath, "w")
    jsonFile.write(jsonString)
    jsonFile.close()

def print_progress(text, default_space=40):
    print("{} {:{}} done".format(text, "." * (default_space - len(text)), default_space - len(text)))
