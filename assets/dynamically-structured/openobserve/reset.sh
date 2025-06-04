#!/usr/bin/env bash

# This file prepares a clean environment by removing previous data (e.g., dropping tables); runs
# after `launch.sh` in `ingest` mode

curl -X DELETE -u 'root@clpbench.com:password' localhost:5080/api/default/streams/clpbench1

# keep trying to add nothing to the stream until it is deleted
while true; do
    STATUS=$(curl http://localhost:5080/api/default/clpbench1/_json -i -u 'root@clpbench.com:password' -d '[]' -w "%{http_code}" -s -o /dev/null)

    if [[ "$STATUS" != "400" ]]; then
        break
    fi

    sleep 2
done
