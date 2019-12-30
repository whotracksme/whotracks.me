import sqlite3
import unittest

from whotracksme.data import load_tracker_db


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
        cur.execute('SELECT COUNT(DISTINCT id) FROM trackers WHERE alias is NULL')
        tracker_count = cur.fetchone()[0]
        self.assertEqual(domain_tracker_count, tracker_count)

    def test_tracker_ids_ascii(self):
        cur = self.conn.cursor()
        cur.execute('SELECT id FROM trackers')
        trackers = cur.fetchall()
        for tracker in trackers:
            try:
                tracker[0].encode('ascii')
            except:
                self.fail(f'"{tracker[0]}" is not ascii')

    def test_company_ids_ascii(self):
        cur = self.conn.cursor()
        cur.execute('SELECT id FROM companies')
        companies = cur.fetchall()
        for company in companies:
            try:
                company[0].encode('ascii')
            except:
                self.fail(f'"{company[0]}" is not ascii')

    def test_domains_ascii(self):
        cur = self.conn.cursor()
        cur.execute('SELECT domain FROM tracker_domains')
        domains = cur.fetchall()
        for domain in domains:
            try:
                domain[0].encode('ascii')
            except:
                self.fail(f'"{domain[0]}" is not ascii')

if __name__ == '__main__':
    unittest.main()
