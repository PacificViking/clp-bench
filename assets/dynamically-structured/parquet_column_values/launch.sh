#!/usr/bin/env bash

# This script initializes and starts the tool (e.g., if it functions as a server or service)

# Your launch command goes here

# nohup python3 /home/presto/presto-server/target/presto-server-0.293-SNAPSHOT/bin/launcher.py run --etc-dir=/home/presto/etc_coordinator &
bash -c "python3 /home/presto/presto-server/target/presto-server-0.293-SNAPSHOT/bin/launcher.py run --etc-dir=/home/presto/etc_coordinator" &

nohup /home/presto/presto-native-execution/build/presto_cpp/main/presto_server --logtostderr=1 --etc_dir=/home/presto/presto-native-execution/build/etc_worker > /tmp/presto_server.log 2>&1 &

while true; do
  if nc -z localhost 8080 && nc -z localhost 7777; then
    break
  fi
  sleep 1
done

sleep 30
