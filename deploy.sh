#!/bin/bash

eval $(minikube -p parca-demo docker-env)

kubectl apply -f https://github.com/parca-dev/parca/releases/download/v0.8.1/kubernetes-manifest.yaml
kubectl apply -f https://github.com/parca-dev/parca-agent/releases/download/v0.5.0/kubernetes-manifest.yaml

source ./kube-prometheus/monitoring-deploy.sh

echo "Building the Go demo"

docker build -t parca-demo:go ./go
kubectl apply -f ./go/deployment.yaml

echo "Building the Rust demo"

docker build -t parca-demo:rust ./rust
kubectl apply -f ./rust/deployment.yaml

echo "Building the Python demo"

docker build -t parca-demo:python ./python
kubectl apply -f ./python/deployment.yaml

echo "Building the NodeJS demo"

docker build -t parca-demo:nodejs ./nodejs
kubectl apply -f ./nodejs/deployment.yaml

echo "Building the NextJS demo"

docker build -t parca-demo:nextjs ./nextjs
kubectl apply -f ./nextjs/deployment.yaml

echo "Building the Java demo"

docker build -t parca-demo:java ./java
kubectl apply -f ./java/deployment.yaml

echo "Connect to Parca by running: kubectl port-forward -n parca svc/parca 7070"
echo "Connect to Prometheus by running: kubectl port-forward -n monitoring svc/prometheus-k8s 9090"
echo "Connect to Grafana by running: kubectl port-forward -n monitoring svc/grafana 3000"
echo "Connect to Nextjs demo app by running: kubectl port-forward -n parca svc/demo-nextjs 5000"
