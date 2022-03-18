#!/bin/bash

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
