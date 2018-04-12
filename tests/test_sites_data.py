import unittest

from whotracksme.data import DataSource

class TestSitesData(unittest.TestCase):

    def test_all_sites_have_category(self):
        sites = ds = DataSource().sites.get_snapshot()
        sites[sites.category == '']
        no_category_sites = list(sites[sites.category == ''].itertuples())
        self.assertEqual(no_category_sites, [])


if __name__ == '__main__':
    unittest.main()
