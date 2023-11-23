#!/usr/bin/env bash

# This script helps to run given python script on multiple python versions on Kubernetes.

set -euo pipefail

# Function to kill child processes
function kill_children {
    pkill -P $$
}

# Trap the SIGINT signal (Ctrl+C) and execute the kill_children function
trap 'kill_children' SIGINT

# https://hub.docker.com/_/python/tags
python_versions=(
    2.7
    3.3
    3.4
    3.5
    3.6
    3.7
    3.8
    3.9
    3.10
    3.11
)

# Run python script on each python version.
for python_version in "${python_versions[@]}"; do
    echo "Running on python ${python_version}"
    docker run -t --rm -v "$(pwd)":/app --entrypoint python python:"${python_version}" /app/"$@" &
done

wait
