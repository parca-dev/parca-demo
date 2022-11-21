FROM docker.io/php:8.1-alpine

WORKDIR /app

COPY demo.php .

CMD ["php", "-d", "zend_extension=opcache.so", "-d", "opcache.enable_cli=1", "-d", "opcache.jit=function", "-d", "opcache.jit_buffer_size=64M", "-d", "opcache.jit_debug=0x10", "demo.php"]
