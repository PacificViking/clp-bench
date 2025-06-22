#!/usr/bin/env bash

set -e

if [ -z "$1" ]; then
    echo "Error: Datasets path argument is missing."
    echo "Usage: bash ./docker-run.sh <absolute_datasets_path>"
    exit 1
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
config_file="$script_dir/include/config.xml"
users_config_file="$script_dir/include/users.xml"
container_name=$(cat "$script_dir/container-name")
workdir=/home

docker run \
    --privileged \
    -it \
    --rm \
    --workdir "$workdir" \
    --network host \
    --name "$container_name" \
    --mount "type=bind,src=$script_dir,dst=/home/assets" \
    --mount "type=bind,src=$1,dst=/home/datasets" \
    --mount "type=bind,src=$config_file,dst=/etc/clickhouse-server/config.d/benchconfig.xml" \
    --mount "type=bind,src=$users_config_file,dst=/etc/clickhouse-server/users.d/benchconfig.xml" \
    "$container_name" \
    bash -c "cd ${workdir} && /bin/bash -l"
