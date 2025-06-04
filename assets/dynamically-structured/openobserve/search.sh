#!/usr/bin/env bash

# This script takes queries specified in `config.yaml` as command line argument and executes them

set -e
if [ -z "$1" ]; then
    echo "Error: Query argument is missing."
    echo "Usage: bash ./search.sh <query>"
    exit 1
fi

# Your query command goes here
output=$(/openobserve sql -t 100y --execute "SELECT COUNT(*) FROM clpbench1 WHERE $1" 2> /dev/null)
# debug logs out of stderr is messing up our python that reads everything

# outputs:
# +----------+
# | count(*) |
# +----------+
# | 454      |
# +----------+

# remove newlines, get what's in between the 3rd and 4th |, then remove the spaces around it
field=$(echo "$output" | tr '\n' ' ' | awk -F'\\|' '{print $4}' | sed 's/^ *//;s/ *$//')

echo "$field"
