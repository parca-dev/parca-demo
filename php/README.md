# PHP

Requires PHP 8 or above with JIT compiler enabled.

See:

* https://wiki.php.net/rfc/jit#phpini_defaults
* https://www.php.net/manual/en/opcache.configuration.php
* https://github.com/php/php-src/blob/master/ext/opcache/jit/zend_jit.h

`opcache.jit_debug=0x10` enables Perf map, `opcache.jit_debug=0x20` enables JITDUMP, `opcache.jit_debug=0x30` enables both.

> **Note**
>
> This demo is _incomplete_: the [docker.io/library/php](https://hub.docker.com/_/php) container image is not built
> with `-fno-omit-frame-pointer`, Parca Agent is not be able to unwind the stacktraces at the moment.
