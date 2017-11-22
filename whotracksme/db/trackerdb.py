import sqlite3
import pkgutil


def load_tracker_db(loc=':memory:'):
    connection = sqlite3.connect(loc)
    with connection:
        connection.executescript(pkgutil.get_data(
            'whotracksme',
            'db/trackerdb.sql'
        ).decode('utf-8'))
    return connection


def dump_tracker_db(conn):
    with open(_tracker_db_path(), 'w') as fp:
        for line in conn.iterdump():
            fp.write('%s\n' % line)
