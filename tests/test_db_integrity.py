import unittest
from db.trackerdb import load_tracker_db, dump_tracker_db

class TestDbIntegrity(unittest.TestCase):

    def setUp(self):
        self.conn = load_tracker_db()

    def test_all_trackers_have_domains(self):
        domainless_trackers = self.conn.execute('''select id from
            (select id, tracker_domains.tracker from trackers left join tracker_domains ON trackers.id = tracker_domains.tracker)
        where tracker is NULL''').fetchall()
        self.assertEqual(domainless_trackers, [])

    def test_companies_have_trackers(self):
        childless_companies = self.conn.execute('''select id FROM
            (select companies.id, trackers.id AS tid from companies left join trackers on trackers.company_id = companies.id)
        where tid is null''').fetchall()
        self.assertEqual(childless_companies, [])

if __name__ == '__main__':
    unittest.main()