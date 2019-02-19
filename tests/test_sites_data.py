import unittest

from whotracksme.data import DataSource

class TestSitesData(unittest.TestCase):

    def test_all_sites_have_category(self):
        sites = DataSource().sites.get_snapshot()
        no_category_sites = list(filter(lambda s: s.category == '', sites))
        self.assertEqual(no_category_sites, [])


if __name__ == '__main__':
    unittest.main()
