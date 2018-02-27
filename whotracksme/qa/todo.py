import sqlite3
from whotracksme.qa.utils import retrieve_status, write_to_file


def create_task_files(needqa_folder, **kwargs):
    """
    This makes sure it writes the received tasks (dictionary) to
    the QA folder. Each key becomes a file.
    Args:
        needqa_folder: the QA tasks folder (output folder)
        **kwargs: {"task_name": individual_tasks_dict}

    Returns:
    """
    for filename, output in kwargs.items():
        print(f'Task: {filename} created')
        write_to_file(needqa_folder.joinpath(filename), output)


def upgrade_to_https(tracker_db):
    """
    Checks `website_url` for all trackers in the db,
    checks if it can be safely upgraded to https and
    returns a dictionary containing QA tasks.

    Args:
        tracker_db: <string> tracker_db filename

    Returns: QA tasks dictionary for tracker urls
        - update_urls: Can be safely upgraded to https
        - manually_check_urls: Need to be looked at on a case-to-case basis.
    """

    to_fetch = {}
    to_edit = {}
    to_check_manually = {}

    connection = sqlite3.connect(tracker_db)
    for row in connection.execute('SELECT id, name, website_url FROM trackers'):
        if row[2] and not row[2].startswith("https"):
            url = row[2].replace("http", "https")
            to_fetch[url] = row[0]

    results = retrieve_status(to_fetch.keys())
    for r in results:
        id = to_fetch[r['original_url']]
        if not str(r['status']).startswith('4'):
            to_edit[id] = str(r['final_url'])
        else:
            to_check_manually[id] = r['original_url'].replace('https', 'http')

    return {
        "update_urls": to_edit,
        "manually_check_urls": to_check_manually
    }
