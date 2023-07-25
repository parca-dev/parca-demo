# Python

Requires Python 3.12 or above. And the interpreter needs to be compiled with `-fno-omit-frame-pointer` and `-mno-omit-leaf-frame-pointer`.

See https://docs.python.org/3.12/howto/perf_profiling.html#perf-profiling and https://github.com/python/cpython/issues/96143.

> **How to obtain the best results**
> For best results, Python should be compiled with `CFLAGS="-fno-omit-frame-pointer -mno-omit-leaf-frame-pointer"`` as this allows profilers to unwind using only the frame pointer and not on DWARF debug information. **This is because as the code that is interposed to allow perf support is dynamically generated it doesn’t have any DWARF debugging information available.**

> You can check if your system has been compiled with this flag by running:

```shell
python -m sysconfig | grep 'no-omit-frame-pointer'
```

> If you don’t see any output it means that your interpreter has not been compiled with frame pointers and therefore it may not be able to show Python functions in the output of perf.

## Demo

![Parca](img/parca.png)

![Polar Signals Cloud](img/polarsignals-cloud.png)

## Run

### On host

```shell
python3.12 -X perf  python/main.py
# OR
PYTHONPERFSUPPORT=1 python3.12 python/main.py

```

### In Docker

```shell
docker build -t parca-demo:python .
# OR if you want to build without frame pointers
docker build -t parca-demo:python-no-frame-pointer -f Dockerfile.no_frame_pointer .
```

## Notes

1. The [docker.io/library/python](https://hub.docker.com/_/python) container image is not built with `CFLAGS="-fno-omit-frame-pointer -mno-omit-leaf-frame-pointer"` ([python/cpython#96174](https://github.com/python/cpython/issues/96174)).
2. Probably, the easiest way to get a Python interpreter with `CFLAGS="-fno-omit-frame-pointer -mno-omit-leaf-frame-pointer"` is to will be to use Fedora. The project is committed to providing frame pointers in all packages https://fedoraproject.org/wiki/Changes/fno-omit-frame-pointer). See https://lists.fedoraproject.org/archives/list/devel@lists.fedoraproject.org/thread/OOJDAKTJB5WGMOZRXTUX7FTPFBF3H7WE for Python.
