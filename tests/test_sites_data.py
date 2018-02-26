import unittest

from whotracksme.data import load_sites

class TestSitesData(unittest.TestCase):

    def test_all_sites_have_category(self):
        sites = load_sites()
        no_category_sites = [site for site, data in sites.items() if data.get('category', '') == '']
        self.assertEqual(no_category_sites, [])


if __name__ == '__main__':
    unittest.main()
