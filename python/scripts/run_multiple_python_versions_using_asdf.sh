#!/usr/bin/env bash

# set -x
set -euo pipefail

# This script helps to run given python script on multiple python versions on the host using asdf (https://asdf-vm.com).

# Function to kill child processes
function kill_children {
    pkill -P $$
}

# Trap the SIGINT signal (Ctrl+C) and execute the kill_children function
trap 'kill_children' SIGINT

# https://devguide.python.org/versions/
python_versions=(
    2.7.18
    # 3.3.7
    # 3.4.8
    3.5.10
    3.6.15
    3.7.17
    3.8.18
    3.9.18
    3.10.13
    3.11.5
)

# Check if ASDF already installed.
if ! command -v asdf &>/dev/null; then
    echo "asdf could not be found"
    exit
fi

# Check if asdf-python plugin already installed.
if ! asdf plugin list | grep -q python; then
    echo "asdf-python plugin could not be found"
    exit
fi

# Test if all the versions are installed.
# for python_version in "${python_versions[@]}"; do
#     if ! asdf list python | grep -q "${python_version}"; then
#         echo "python ${python_version} is not installed"
#         echo "Please run python/scripts/download_python_runtimes_using_asdf.sh"
#         exit
#     fi
# done

# Run python script on each python version.
for python_version in "${python_versions[@]}"; do
    echo "Running on python ${python_version}"
    current_python=$(asdf where python "${python_version}")/bin/python
    $current_python "$@" &
done

wait
