FROM docker.io/debian:stable as builder

# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends build-essential

ARG GCC_FLAGS

WORKDIR /app

COPY main.c .

RUN gcc ${GCC_FLAGS} -o parca-demo main.c

FROM docker.io/debian:stable-slim as runner

# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get install -y --no-install-recommends libc6-dbg && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /app/parca-demo /bin

CMD ["/bin/parca-demo"]
