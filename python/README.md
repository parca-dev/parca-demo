# Python

See https://docs.python.org/3.12/howto/perf_profiling.html#perf-profiling

> **Note**
>
> This demo is _incomplete_: the [docker.io/library/python](https://hub.docker.com/_/python) container image is not built
> with `CFLAGS="-fno-omit-frame-pointer -mno-omit-leaf-frame-pointer"`, Parca Agent is not be able to unwind the stacktraces at the moment.
