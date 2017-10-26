import os.path
import sqlite3

def _tracker_db_path():
    prefix = os.path.dirname(__file__)
    return os.path.join(prefix, 'trackerdb.sql')

def load_tracker_db(loc=':memory:'):
    conn = sqlite3.connect(loc)
    path = os.path.dirname(__file__)
    with open(_tracker_db_path()) as fp:
        cur = conn.cursor()
        cur.executescript(fp.read())
    return conn

def dump_tracker_db(conn):
    with open(_tracker_db_path(), 'w') as fp:
        for line in conn.iterdump():
            fp.write('%s\n' % line)
