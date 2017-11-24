from collections import namedtuple
from random import randint
import colour


CliqzColors = {
    "purple": "#A069AB",
    "blue": "#00AEF0",
    "black": "#1A1A25",
    "white": "#FFFFFF",
    "bright_gray": "#BFCBD6",
    "inactive_gray": "#BCC4CE",
    "transparent": "#00000000",
    "green": "#50B1A2",
    "red": "#C3043E",
    "yellow": "#FFC802",
    "orange": "#D4656B",
    "gray_blue": "#5F7C86"
}

TrackerColors = {
    "advertising": "#BF90D2",
    "comments": "#43B7C5",
    "customer_interaction": "#FCC156",
    "essential": "#FC9834",
    "adult_advertsing": "#E3A2D4",
    "site_analytics": "#84D7F0",
    "social_media": "#87BCEF",
    "audio_video_player": "#F86D4F",
    "cdn":  "#C0BB61",
    "misc": "#80C87D",
    "pornvertising": "#E3A2D4",
    "hosting": "#444",
    "unknown": "#D0D0D0",
    "extensions": "orange"
}


SiteCategoryColors = {
    '': "#000",
    'Adult': "#FFAEB9",
    'Banking': "#FFE4C4",
    'Business': "blue",
    'E-Commerce': "#71C671",
    'Entertainment': "#B8B8B8",
    'News & Portals': "#B2DFEE",
    'Recreation': "#B9D3EE",
    'Reference': "#E0EEEE"
}


BiggestTrackerColors = {
    'Google': "#008744",
    'Facebook': "#3b5998",
    'Amazon associates': "#ff9900",
    'Infonline': "#dedc00",
    'Criteo': "#333",
    'Appnexus': "orange",
    'Adobe': "red",
    'Aditon technologies ag': "#D3D518",
    'Ebay partner network': "#85B716",
    'Microsoft advertising': "#00A4EF"
}


def palette(color1, color2, number_of_shades):
    c1 = colour.Color(color1)
    c2 = colour.Color(color2)
    return list(map(colour.Color.get_hex, list(c1.range_to(c2, number_of_shades))))


def random_color():
    r = lambda: randint(0, 255)
    return '#%02X%02X%02X' % (r(), r(), r())

