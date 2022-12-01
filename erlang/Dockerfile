FROM docker.io/erlang:25 AS build

RUN mkdir /buildroot
WORKDIR /buildroot

COPY fib fib

WORKDIR /buildroot/fib
RUN rebar3 as prod release

# Build stage 1
FROM docker.io/ubuntu:22.04

# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get install -y --no-install-recommends lsb-release ubuntu-dbgsym-keyring && \
    echo "deb http://ddebs.ubuntu.com $(lsb_release -cs) main restricted universe multiverse" > /etc/apt/sources.list.d/ddebs.list && \
    echo "deb http://ddebs.ubuntu.com $(lsb_release -cs)-updates main restricted universe multiverse" >> /etc/apt/sources.list.d/ddebs.list && \
    echo "deb http://ddebs.ubuntu.com $(lsb_release -cs)-proposed main restricted universe multiverse" >> /etc/apt/sources.list.d/ddebs.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends libc6-dbg libgcc-s1-dbgsym libstdc++6-dbgsym libtinfo6-dbgsym zlib1g-dbgsym && \
    rm -rf /var/lib/apt/lists/*

COPY --from=build /buildroot/fib/_build/prod/rel/fib /fib

ENV ERL_FLAGS="+JPperf map"
CMD ["/fib/bin/fib", "foreground"]
