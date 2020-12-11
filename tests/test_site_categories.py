import unittest
import csv

VALID_CATEGORIES = set([
    "Adult",
    "Banking",
    "Business",
    "E-Commerce",
    "Entertainment",
    "Government",
    "News and Portals",
    "Political",
    "Recreation",
    "Reference"
])

def iterate_site_categories():
    with open('./whotracksme/data/assets/site_categories.csv', 'r') as fp:
        reader = csv.reader(fp, delimiter=',')
        for line in reader:
            if reader.line_num == 1:
                continue
            yield line


class TestSitesData(unittest.TestCase):

    def test_all_categories_are_valid(self):
        for site, category in iterate_site_categories():
            self.assertIsNotNone(site)
            self.assertTrue('.' in site)
            self.assertIn(category, VALID_CATEGORIES)


    def test_no_repeated_sites(self):
        sites = set([])
        for site, category in iterate_site_categories():
            if site in sites:
                self.fail(f"Site {site} included more than once")
            sites.add(site)


if __name__ == '__main__':
    unittest.main()
