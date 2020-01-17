#!/bin/bash

set -e

# master host
redis_master=${REDIS_MASTER:-redis-master.service.dc1.consul}

# interval for counter increments in seconds
interval=${INTERVAL:-1}

# key for this run
key=`hostname`-`date +'%s'`-counter

# count number of times we've incremented
local_counter=0

# startup log
echo starting counter on key $key at interval $interval seconds

# we send an increment command every $interval seconds, keeping track
# of how many times we've incremented. log if our local counter and
# the redis counter get out of sync
while true
do
  redis_counter=$(echo incr $key | redis-cli --raw -h $redis_master)
  local_counter=$(( local_counter + 1 ))
  echo {\"local_counter\": $local_counter, \"redis_counter\": $redis_counter}

  if [ $redis_counter != $local_counter ]; then
    echo "local and redis counter are out of sync!"
  fi

  sleep $interval
done
