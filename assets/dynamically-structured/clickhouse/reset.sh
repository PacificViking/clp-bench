#!/usr/bin/env bash

collection_name=clickhouse_clp_bench

clickhouse-client \
    --max_threads 1 \
    --query "DROP TABLE IF EXISTS ${collection_name}" >/dev/null 2>&1
clickhouse-client \
    --max_threads 1 \
    --query "SET enable_json_type = 1;" \
    >/dev/null 2>&1
clickhouse-client \
    --max_threads 1 \
    --query "CREATE TABLE ${collection_name}( \
    json JSON \
    ) ENGINE = MergeTree ORDER \
    BY tuple()" >/dev/null 2>&1
