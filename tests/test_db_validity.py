import unittest
import sqlite3
from db.trackerdb import load_tracker_db

class ValidateTrackerDatabase(unittest.TestCase):

    conn = None

    @classmethod
    def setUpClass(cls):
        cls.conn = load_tracker_db()

    def test_db_has_trackers(self):
        cur = self.conn.cursor()
        cur.execute('SELECT COUNT(*) FROM trackers')
        count = cur.fetchone()[0]
        self.assertGreater(count, 0)

    def test_db_has_companies(self):
        cur = self.conn.cursor()
        cur.execute('SELECT COUNT(*) FROM companies')
        count = cur.fetchone()[0]
        self.assertGreater(count, 0)

    def test_db_has_tracker_domains(self):
        cur = self.conn.cursor()
        cur.execute('SELECT COUNT(*) FROM tracker_domains')
        count = cur.fetchone()[0]
        self.assertGreater(count, 0)

    def test_no_trackers_without_domain(self):
        cur = self.conn.cursor()
        cur.execute('SELECT COUNT(DISTINCT tracker) FROM tracker_domains')
        domain_tracker_count = cur.fetchone()[0]
        cur.execute('SELECT COUNT(*) FROM trackers')
        tracker_count = cur.fetchone()[0]
        self.assertEqual(domain_tracker_count, tracker_count)

if __name__ == '__main__':
    unittest.main()
