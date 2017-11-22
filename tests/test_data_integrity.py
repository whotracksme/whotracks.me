from operator import itemgetter
import unittest

from whotracksme.data import load_tracker_db, load_apps, load_companies


class TestDataIntegrity(unittest.TestCase):

    def setUp(self):
        self.conn = load_tracker_db()

    def test_all_trackers_have_db_entry(self):
        apps = load_apps()
        cur = self.conn.cursor()
        app_ids = sorted(apps.keys())
        db_trackers = cur.execute('select id, category_id from trackers where id IN ({}) order by id'.format(
            ','.join(["'{}'".format(id) for id in app_ids])
        )).fetchall()
        self.assertEqual(set(app_ids), set(map(itemgetter(0), db_trackers)))
        # check all have a category
        without_category = list(filter(lambda tracker: tracker[1] is None, db_trackers))
        self.assertEqual([], without_category)

    def test_all_companies_have_db_entry(self):
        companies = load_companies()
        cur = self.conn.cursor()
        company_ids = sorted(companies.keys())
        db_companies = cur.execute('select id from companies where id IN ({}) order by id'.format(
            ','.join(["'{}'".format(id) for id in company_ids])
        )).fetchall()
        self.assertEqual(set(company_ids), set(map(itemgetter(0), db_companies)))


if __name__ == '__main__':
    unittest.main()
