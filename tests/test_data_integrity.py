from operator import itemgetter
import unittest

from whotracksme.data import load_tracker_db, DataSource


class TestDataIntegrity(unittest.TestCase):

    def setUp(self):
        self.conn = load_tracker_db()
        self.ds = DataSource()

    def test_all_trackers_have_db_entry(self):
        trackers = self.ds.trackers
        cur = self.conn.cursor()
        app_ids = trackers.get_snapshot().tracker
        db_trackers = cur.execute('select id, category_id from trackers where id IN ({}) order by id'.format(
            ','.join(["'{}'".format(id) for id in app_ids])
        )).fetchall()
        self.assertEqual(set(app_ids), set(map(itemgetter(0), db_trackers)))
        # check all have a category
        without_category = list(filter(lambda tracker: tracker[1] is None, db_trackers))
        self.assertEqual([], without_category)

    def test_all_companies_have_db_entry(self):
        companies = self.ds.trackers.companies
        cur = self.conn.cursor()
        company_ids = sorted(companies.get_snapshot().company)
        db_companies = cur.execute('select id from companies where id IN ({}) order by id'.format(
            ','.join(["'{}'".format(id) for id in company_ids])
        )).fetchall()
        self.assertEqual(set(company_ids), set(map(itemgetter(0), db_companies)))


if __name__ == '__main__':
    unittest.main()
