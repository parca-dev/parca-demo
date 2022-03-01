#!/bin/bash

kubectl apply --server-side -f ./manifests/setup
until kubectl get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done

kubectl apply -f ./manifests/