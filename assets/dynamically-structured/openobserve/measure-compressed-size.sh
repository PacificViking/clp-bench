#!/usr/bin/env bash

# This script measures the compressed data size post-ingestion, usually via tool-specific methods

# Your archive measuring command goes here

# du "/home/data" -bc | awk "END {print \$1}"
du "/home/data/openobserve/stream/files/default/logs" -bc | awk "END {print \$1}"
