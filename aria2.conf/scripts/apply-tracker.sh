#!/bin/sh

HERE="$PWD"

. "$HERE/config.in"

TRACKER_LIST=`sed -n '/^#/d; /^ *$/d; p' tracker.txt`
TRACKER_LIST=`echo -n "${TRACKER_LIST}" | tr '\n' ','`

sed -i "s|^\(bt-tracker\)=.*|\1=${TRACKER_LIST}|g" "${ARIA2_CONFIG_DIR}/aria2.conf"

