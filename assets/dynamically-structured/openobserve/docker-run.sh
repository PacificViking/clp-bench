#!/usr/bin/env bash

# This script runs the container, taking the dataset path as an argument. Typically, only the
# `container_name` variable needs alignment with `container_id` in `config.yaml`

set -e

if [ -z "$1" ]; then
    echo "Error: Datasets path argument is missing."
    echo "Usage: bash ./docker-run.sh <absolute_datasets_path>"
    exit 1
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
container_name=$(cat "$script_dir/container-name")
workdir=/home

# -p 5080:5080 \
docker run \
    --privileged \
    --network host \
    -it \
    --rm \
    --workdir "$workdir" \
    --name "$container_name" \
    --mount "type=bind,src=$script_dir,dst=/home/assets" \
    --mount "type=bind,src=$1,dst=/home/datasets" \
    -e ZO_ROOT_USER_EMAIL="root@clpbench.com" \
    -e ZO_ROOT_USER_PASSWORD="password" \
    "$container_name" \
    bash -c "cd ${workdir} && /bin/bash -l"
