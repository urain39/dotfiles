#!/usr/bin/env sh

PROCESS_NAME='aria2cli'

while :; do
  ps aux | grep -v 'grep' | grep -q "${PROCESS_NAME}" || \
     {
       echo "Cannot find the ${PROCESS_NAME}!"
       echo "System will poweroff on 30s later..."
       sleep 30
       echo "System poweroff at the $(date)" > ~/shutdown.log
       systemctl poweroff 
     } 
  echo "Found the ${PROCESS_NAME}."
  echo "Sleep 60s to next checking..."
  sleep 60
done
