#!/bin/bash

eval "$(minikube -p parca-demo docker-env)"

echo "Building the Go demo"

make -C go build
kubectl apply -f ./go/deployment.yaml

echo "Building the CGo demo"

make -C go-cgo build
kubectl apply -f ./go-cgo/deployment.yaml

echo "Building the C demo"

make -C c build
kubectl apply -f ./c/deployment.yaml

echo "Building the C++ demo"

make -C cpp build
kubectl apply -f ./cpp/deployment.yaml

echo "Building the Rust demo"

make -C rust build
kubectl apply -f ./rust/deployment.yaml

echo "Building the .NET demo"

make -C dotnet build
kubectl apply -f ./dotnet/deployment.yaml

echo "Building the Python demo"

make -C python build
kubectl apply -f ./python/deployment.yaml

echo "Building the Julia demo"

make -C julia build
kubectl apply -f ./julia/deployment.yaml

echo "Building the PHP demo"

make -C php build
kubectl apply -f ./php/deployment.yaml

echo "Building the NodeJS demo"

make -C nodejs build
kubectl apply -f ./nodejs/deployment.yaml

echo "Building the NextJS demo"

make -C nextjs build
kubectl apply -f ./nextjs/deployment.yaml

echo "Building the Java demo"

make -C java build
kubectl apply -f ./java/deployment.yaml
