#!/usr/bin/env bash

# This script handles data ingestion, with clp-bench measuring the total latency of this script.
# Avoid adding extra operations

set -e
if [ -z "$1" ]; then
    echo "Error: Datasets path argument is missing."
    echo "Usage: bash ./ingest.sh <absolute_datasets_path_in_container>"
    exit 1
fi

# Your ingest command goes here

/home/presto/presto-cli/target/presto-cli-0.293-SNAPSHOT-executable.jar --catalog hive --execute "
CREATE SCHEMA IF NOT EXISTS hive.bench_schema;

CREATE TABLE IF NOT EXISTS hive.bench_schema.bench_table (
    line VARCHAR
)
WITH (
    format = 'PARQUET'
);
" || true

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
python3 "${script_dir}/ingest.py" "$1"

exit 0

