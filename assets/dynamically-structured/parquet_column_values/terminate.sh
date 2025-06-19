#!/usr/bin/env bash

pkill -f /usr/lib/jvm/java-11-openjdk-amd64/bin/java
pkill presto_server

while true; do
  if ! nc -z localhost 8080 && ! nc -z localhost 7777; then
    break
  fi
  sleep 1
done
