#!/usr/bin/env python

import sys
import time

try:
    from urllib import unquote as url_unquote
except ImportError:
    from urllib.parse import unquote as url_unquote


def main(argv):
    if len(argv) != 2:
        print("Usage: {0} <URL>".format(sys.argv[0]))
        sys.exit(1)

    url = argv[1]
    tracker_list = url_unquote(url).split('&tr=')[1:]
    tracker_list = [tracker.strip() for tracker in tracker_list]
    with open('tracker.txt', 'a') as fp:
        fp.write('# Date: {0}\n'.format(
                time.strftime('%Y-%m-%d %H:%M:%S') 
            ) +
            '\n'.join(tracker_list) + '\n'
        )


if __name__ == '__main__':
    try:
        main(sys.argv)
    except KeyboardInterrupt:
        sys.exit(0)
