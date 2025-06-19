#!/usr/bin/env bash

# This script measures the compressed data size post-ingestion, usually via tool-specific methods

# Your archive measuring command goes here
du "/home/pacificviking-dev/presto/hive-data" -bc | awk "END {print \$1}"
# /home/presto/presto-cli/target/presto-cli-0.293-SNAPSHOT-executable.jar --catalog hive --execute "USE bench_schema; SELECT \$file_size FROM bench_table" 2>/dev/null | python -c "import sys; print(sum(int(l) for l in sys.stdin))"
# echo $(/home/presto/presto-cli/target/presto-cli-0.293-SNAPSHOT-executable.jar --catalog hive --execute "USE bench_schema; SELECT SUM(\$file_size) FROM bench_table" 2>/dev/null)
