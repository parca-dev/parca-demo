FROM erlang:25

RUN mkdir /buildroot
WORKDIR /buildroot

COPY fib fib

WORKDIR /buildroot/fib
RUN rebar3 as prod release

# Build stage 1
FROM ubuntu:22.04

RUN apt-get update; \
    apt-get install -y lsb-release ubuntu-dbgsym-keyring; \
    echo "deb http://ddebs.ubuntu.com $(lsb_release -cs) main restricted universe multiverse" > /etc/apt/sources.list.d/ddebs.list; \
    echo "deb http://ddebs.ubuntu.com $(lsb_release -cs)-updates main restricted universe multiverse" >> /etc/apt/sources.list.d/ddebs.list; \
    echo "deb http://ddebs.ubuntu.com $(lsb_release -cs)-proposed main restricted universe multiverse" >> /etc/apt/sources.list.d/ddebs.list; \
    apt-get update; \
    apt-get install -y libc6-dbg libgcc-s1-dbgsym libstdc++6-dbgsym libtinfo6-dbgsym zlib1g-dbgsym

COPY --from=0 /buildroot/fib/_build/prod/rel/fib /fib

ENV ERL_FLAGS="+JPperf map"
CMD ["/fib/bin/fib", "foreground"]
