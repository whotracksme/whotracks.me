import unittest

from whotracksme.data import load_tracker_db


class TestDbIntegrity(unittest.TestCase):

    def setUp(self):
        self.conn = load_tracker_db()

    def test_all_trackers_have_domains(self):
        domainless_trackers = self.conn.execute('''select id from
            (select id, tracker_domains.tracker from trackers left join tracker_domains ON trackers.id = tracker_domains.tracker WHERE alias IS NULL)
        where tracker is NULL''').fetchall()
        self.assertEqual(domainless_trackers, [])

    ## Disabled because TrackerDB has "archived" entries, which have no active patterns.
    ## In principle, filtering the "archived" ones out would be safe; but it is neither
    ## sufficent nor possible with only the trackerdb.sql file.
    ## Overall, maintaining this requirement here does not seem to be worth the effort.
    ## Instead, whotracks.me should be able to operate with organizations without pattern.
    ##
    # def test_companies_have_trackers(self):
    #     childless_companies = self.conn.execute('''select id FROM
    #         (select companies.id, trackers.id AS tid from companies left join trackers on trackers.company_id = companies.id)
    #     where tid is null''').fetchall()
    #     self.assertEqual(childless_companies, [])

if __name__ == '__main__':
    unittest.main()
