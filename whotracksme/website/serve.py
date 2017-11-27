#! /usr/bin/env python
# -*- coding: utf-8 -*-


from multiprocessing import Process
import os
import time

from sanic import Sanic
from watchdog.observers import Observer
import watchdog


def watch(builder):
    """Watch changes in directories and yield events indicating where the change
    happened: BLOG_FOLDER, STATIC_FOLDER, TEMPLATES_FOLDER, DATA_FOLDER. The
    events are then consumed by `build` which will rebuild only what is needed
    after each change.
    """
    watched_directories = {
        'blog': builder.on_blog_folder_change,
        'data': builder.on_data_folder_change,
        'static': builder.on_static_folder_change,
        'templates': builder.on_templates_folder_change
    }

    def handle_event(event):
        path = event.src_path
        directory = os.path.relpath(os.path.dirname(path))
        if directory in watched_directories:
            print('>', path, 'changed')
            watched_directories[directory]()

    class Callback(watchdog.events.FileSystemEventHandler):
        def on_created(self, event):
            handle_event(event)
        def on_deleted(self, event):
            handle_event(event)
        def on_modified(self, event):
            handle_event(event)
        def on_moved(self, event):
            handle_event(event)

    observer = Observer()
    observer.schedule(Callback(), '.', recursive=True)
    observer.start()

    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()


def serve_site(port):
    """Serve site locally."""
    app = Sanic(__name__, log_config=None)
    app.static('/', './_site/index.html')
    app.static('/', './_site/')
    app.run(
        host="0.0.0.0",
        port=port,
    )


def serve(builder):
    # Start serving the website locally
    port = 8000
    serve_process = Process(target=serve_site, args=(port,), daemon=True)
    serve_process.start()

    # Start watching for changes
    watch(builder)
