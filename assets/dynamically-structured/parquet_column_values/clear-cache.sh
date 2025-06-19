#!/usr/bin/env bash

# This script clears the tool's cache, essential for cold runs
#
# If there is any internal cache mechanism of the application, you should also clear them here
# (or turn it off when launching it)

sync
echo 1 >/proc/sys/vm/drop_caches
curl -X GET "http://localhost:7777/v1/operation/server/clearCache?type=memory"
curl -X GET "http://localhost:7777/v1/operation/server/clearCache?type=ssd"
