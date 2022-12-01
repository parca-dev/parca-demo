# Erlang App Example

This repository contains a sample Erlang applications that can be profiled using Parca.

The critical parts are:
1. `ERL_FLAGS="+JPperf map"`, so that Erlang JIT produces symbol map files; it can be specified in the `Dockerfile` or deployment manifest (in this example, we do both, which is redundant)
2. Debug symbol packages (see Docker file)

## Deploy on Kubernetes

```bash
kubectl apply -f manifests/deployment.yaml
```
