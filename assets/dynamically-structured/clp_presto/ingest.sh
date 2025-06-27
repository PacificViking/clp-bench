#!/usr/bin/env bash

# This script handles data ingestion, with clp-bench measuring the total latency of this script.
# Avoid adding extra operations

set -e
if [ -z "$1" ]; then
    echo "Error: Datasets path argument is missing."
    echo "Usage: bash ./ingest.sh <absolute_datasets_path_in_container>"
    exit 1
fi

clp_s_binary=/home/assets/clp-s
data_path=/home/archives

timestamp="t.\$date"

# /home/presto/presto-cli/target/presto-cli-0.293-SNAPSHOT-executable.jar --catalog clp --execute "
# CREATE SCHEMA IF NOT EXISTS clp.default;
# " || true

# /home/clp-json-x86_64-v0.2.0-dev/sbin/compress.sh --timestamp-key "$timestamp" "$1"

mysql -h 10.1.0.21 -P 6001 -u clp-user -ppKvIMoPXAbk -e 'UPDATE clp_datasets SET archive_storage_directory="/home/clp-json-x86_64-v0.2.0-dev/var/data/archives/default" WHERE name="default";' clp-db

# "${clp_s_binary}" c --timestamp-key "$timestamp" --target-encoded-size 268435456 "$data_path" "$1"

