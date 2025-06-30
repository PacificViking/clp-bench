#!/usr/bin/env bash

# This script takes queries specified in `config.yaml` as command line argument and executes them

set -e
if [ -z "$1" ]; then
    echo "Error: Query argument is missing."
    echo "Usage: bash ./search.sh <query>"
    exit 1
fi

# echo "Decompressing instead of searching..."
zstd --single-thread -d -f -k /home/compressed.zst -o /home/decompressed.log > /dev/null 2>&1
# decompress, force replace decompressed.log

cmp -s /home/decompressed.log /home/datasets/mongod.log  # make sure they are the same

echo $?

# Your query command goes here
