import os.path
import sqlite3

def _tracker_db_path():
    prefix = os.path.dirname(__file__)
    return os.path.join(prefix, 'trackerdb.sql')

def load_tracker_db(loc=':memory:'):
    connection = sqlite3.connect(loc)
    with open(_tracker_db_path()) as fp:
        with connection:
            connection.executescript(fp.read())
    return connection

def dump_tracker_db(conn):
    with open(_tracker_db_path(), 'w') as fp:
        for line in conn.iterdump():
            fp.write('%s\n' % line)
