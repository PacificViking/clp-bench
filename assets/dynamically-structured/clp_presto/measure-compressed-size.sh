#!/usr/bin/env bash

# This script measures the compressed data size post-ingestion, usually via tool-specific methods

# Your archive measuring command goes here
# du "/home/archives" -bc | awk "END {print \$1}"
# /home/presto/presto-cli/target/presto-cli-0.293-SNAPSHOT-executable.jar --catalog hive --execute "USE bench_schema; SELECT \$file_size FROM bench_table" 2>/dev/null | python -c "import sys; print(sum(int(l) for l in sys.stdin))"
# echo $(/home/presto/presto-cli/target/presto-cli-0.293-SNAPSHOT-executable.jar --catalog hive --execute "USE bench_schema; SELECT SUM(\$file_size) FROM bench_table" 2>/dev/null)

du "/home/clp-json-x86_64-v0.2.0-dev/var" -bc | awk "END {print \$1}"
