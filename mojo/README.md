# Parca Agent mojo support

Parca Agent can be use to profile [mojo](https://github.com/modularml/mojo?tab=readme-ov-file) applications.

In this repository you can find an example of how to build a mojo application with profiling support.

## Build

The following command will build a mojo container for your application.

> [!NOTE]
> You need to have auth key for mojo from [modular.ml](https://developer.modular.com/download)
> If you set your environment Makefile will use it automatically.

```shell
# build mojo container with auth key from environment
$ make base
# or explicitly specify the auth key
$ make MODULAR_AUTH_KEY=your_auth_key base
# build mojo application
$ make build
```

## Example

> [https://pprof.me/c727c27117bdbb7ac3e257d1ccdbf0c6](https://pprof.me/c727c27117bdbb7ac3e257d1ccdbf0c6)

<iframe
    src="https://pprof.me/c727c27117bdbb7ac3e257d1ccdbf0c6/embed/?profileType=profile%3Asamples%3Acount%3Acpu%3Ananoseconds"
    width="1200"
    height="600"
    frameborder="0"
></iframe>
