#!/bin/bash

redis_host=${1:-localhost}

while true
do
  redis-cli -h $redis_host ping
  if [ "$?" == 0 ]; then
    break
  fi
  sleep 5
done
