#!/usr/bin/env bash

pkill -f /usr/lib/jvm/java-11-openjdk-amd64/bin/java
pkill presto_server

sleep 10
