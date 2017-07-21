#!/bin/sh
LOG_FILE=$SONAR_CURRENT/logs/web.log
count=0
while [ ! -f $LOG_FILE ]
do
  echo "Log file not found, waiting..."
  sleep 3
  ((count++))
  if [ $count -gt 4 ]; then
    exit 0
  fi
done
tail -f $LOG_FILE
