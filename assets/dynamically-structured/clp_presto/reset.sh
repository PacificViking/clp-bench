#!/usr/bin/env bash

# This file prepares a clean environment by removing previous data (e.g., dropping tables); runs
# after `launch.sh` in `ingest` mode

# rm -r /home/clp-json-x86_64-v0.2.0-dev/var/log;
rm -r /home/clp-json-x86_64-v0.2.0-dev/var/data;

mysql -h 10.1.0.21 -P 6001 -u clp-user -ppKvIMoPXAbk -e 'DELETE FROM clp_datasets;' clp-db
mysql -h 10.1.0.21 -P 6001 -u clp-user -ppKvIMoPXAbk -e 'DELETE FROM clp_default_archive_tags;' clp-db
mysql -h 10.1.0.21 -P 6001 -u clp-user -ppKvIMoPXAbk -e 'DELETE FROM clp_default_archives;' clp-db
mysql -h 10.1.0.21 -P 6001 -u clp-user -ppKvIMoPXAbk -e 'DELETE FROM clp_default_column_metadata;' clp-db
mysql -h 10.1.0.21 -P 6001 -u clp-user -ppKvIMoPXAbk -e 'DELETE FROM clp_default_files;' clp-db
mysql -h 10.1.0.21 -P 6001 -u clp-user -ppKvIMoPXAbk -e 'DELETE FROM clp_default_tags;' clp-db

exit 0
