FROM modular/mojo:latest as builder

WORKDIR /app
ADD main.mojo .
RUN mojo build main.mojo

FROM python:3.11 as debuginfo

FROM python:3.11-slim as runner
COPY --from=debuginfo /usr/local/lib/libpython3.11.so.1.0 /usr/local/lib/libpython3.11.so.1.0

WORKDIR /app
COPY --from=builder /app/main .
ADD simple_interop.py .
ENV MOJO_PYTHON_LIBRARY=/usr/local/lib/libpython3.11.so.1.0
ENTRYPOINT ["./main"]
