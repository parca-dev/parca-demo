# Native Spring Boot example with GraalVM

This repo is an example for how a native Java application can be profiled with Parca Agent. First deploy Parca and Parca Agent as usual, for example [on Kubernetes](https://www.parca.dev/docs/kubernetes).

To run this example native Java Spring Boot app on the same Kubernetes cluster execute:

```bash
kubectl run spring-boot-native-example --image=ghcr.io/parca-dev/spring-boot-native-example:v0.0.1 --port=8080
```

The important parts to make this work is to instruct `native-image` to:

* Generate debuginfo with `-g` (see [this line in build.gradle](./build.gradle#L38))
* Not remove all local symbols with `-H:-DeleteLocalSymbols` (see [this line in build.gradle](./build.gradle#L35))
* Preserve the frame pointer with `-H:+PreserveFramePointer` (see [this line in build.gradle](./build.gradle#L36))
* More detailed symbols with `-H:+SourceLevelDebug` (see [this line in build.gradle](./build.gradle#L37))
* Build a static binary other than libc with `-H:+StaticExecutableWithDynamicLibC` (not strictly necessary but allows using a small base image, see [this line in build.gradle](./build.gradle#L39))

## Preview

You can preview some example profiling data for this example here: https://pprof.me/145a45f
