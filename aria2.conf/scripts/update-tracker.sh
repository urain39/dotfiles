#!/bin/sh

TRACKER_LIST_BEST="https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_best.txt"
TRACKER_LIST_BEST_IP="https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_best_ip.txt"

curl "${TRACKER_LIST_BEST}" > tracker.txt
curl "${TRACKER_LIST_BEST_IP}" >> tracker.txt
