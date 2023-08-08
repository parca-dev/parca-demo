# Native Quarkus example with GraalVM

This is an example for how a native [Quarkus]()-based Java application can be profiled with Parca Agent. First deploy Parca and Parca Agent as usual, for example [on Kubernetes](https://www.parca.dev/docs/kubernetes).

To run this example native Quarkus app on the same Kubernetes cluster execute:

```bash
kubectl run spring-boot-native-example --image=ghcr.io/parca-dev/quarkus-native-example:v0.0.1 --port=8080
```

The important parts to make this work is to instruct `native-image` to:

* Generate debuginfo with `-g`
* Not remove all local symbols with `-H:-DeleteLocalSymbols`
* Preserve the frame pointer with `-H:+PreserveFramePointer`
* More detailed symbols with `-H:+SourceLevelDebug`

These flags are all configured in [`src/main/resources/application.properties`](src/main/resources/application.properties).

(Other than this, this example is the output of `quarkus create`)

## Preview

You can preview some example profiling data for this example here: https://pprof.me/f1261a8
