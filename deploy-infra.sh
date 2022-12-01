#!/usr/bin/env bash
set -euo pipefail

SERVER_LATEST_VERSION=$(curl -s https://api.github.com/repos/parca-dev/parca/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")' | xargs echo -n)
AGENT_LATEST_VERSION=$(curl -s https://api.github.com/repos/parca-dev/parca-agent/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")' | xargs echo -n)

echo "Server version: $SERVER_LATEST_VERSION"
echo "Agent version: $AGENT_LATEST_VERSION"

kubectl apply -f https://github.com/parca-dev/parca/releases/download/"$SERVER_LATEST_VERSION"/kubernetes-manifest.yaml
kubectl apply -f https://github.com/parca-dev/parca-agent/releases/download/"$AGENT_LATEST_VERSION"/kubernetes-manifest.yaml

echo "Connect to Parca by running: kubectl port-forward -n parca svc/parca 7070"

make -C kube-prometheus deploy

echo "Connect to Prometheus by running: kubectl port-forward -n monitoring svc/prometheus-k8s 9090"
echo "Connect to Grafana by running: kubectl port-forward -n monitoring svc/grafana 3000"
