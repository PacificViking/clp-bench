#!/usr/bin/env bash

# This script takes queries specified in `config.yaml` as command line argument and executes them

set -e
if [ -z "$1" ]; then
    echo "Error: Query argument is missing."
    echo "Usage: bash ./search.sh <query>"
    exit 1
fi

# Your query command goes here
echo $(/home/presto/presto-cli/target/presto-cli-0.293-SNAPSHOT-executable.jar --catalog clp --execute "USE default; SELECT '*' FROM default WHERE $1" 2>/dev/null | wc -l)
