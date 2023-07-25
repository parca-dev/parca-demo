#!/usr/bin/env bash
set -euo pipefail

minikube start -p parca-demo \
    --driver=virtualbox \
    --runtime=docker \
    --kubernetes-version=stable \
    --cpus=4 \
    --memory=16gb \
    --disk-size=20gb \
    --docker-opt dns=8.8.8.8 \
    --docker-opt default-ulimit=memlock=9223372036854775807:9223372036854775807
