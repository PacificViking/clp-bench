#!/usr/bin/env bash

# This file prepares a clean environment by removing previous data (e.g., dropping tables); runs
# after `launch.sh` in `ingest` mode

# mkdir -p /home/pacificviking-dev/presto/hive-data/bench_schema/bench_table

/home/presto/presto-cli/target/presto-cli-0.293-SNAPSHOT-executable.jar --catalog hive --execute "
DELETE FROM bench_schema.bench_table WHERE true;
" || true

exit 0
