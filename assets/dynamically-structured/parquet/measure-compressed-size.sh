#!/usr/bin/env bash

# This script measures the compressed data size post-ingestion, usually via tool-specific methods

# Your archive measuring command goes here
du "/home/pacificviking-dev/presto/hive-data" -bc | awk "END {print \$1}"
