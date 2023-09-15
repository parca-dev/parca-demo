#!/usr/bin/env bash

# Copyright 2022-2023 The Parca Authors
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This script helps to download python runtimes using asdf (https://asdf-vm.com).

# https://devguide.python.org/versions/
python_versions=(
    # Unsupported Versions (end of life)
    2.7.18
    3.3.5
    3.4.8
    3.5.10
    3.6.15
    3.7.17
    # Supported Versions
    3.8.18  # security
    3.9.18  # security
    3.10.13 # security
    3.11.5  # bugfix
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

# Install python runtimes.
for python_version in "${python_versions[@]}"; do
    asdf install python "${python_version}"
done
