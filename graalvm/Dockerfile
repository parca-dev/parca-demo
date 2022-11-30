FROM debian:11 AS builder

WORKDIR /app

# hadolint ignore=DL3008
RUN apt-get update \
    &&  apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        gcc \
        libstdc++-10-dev \
        unzip \
        zip \
        zlib1g-dev

RUN curl -sSfo /tmp/sdkman-intall.sh 'https://get.sdkman.io' \
    && bash /tmp/sdkman-intall.sh

RUN bash -c 'source ~/.sdkman/bin/sdkman-init.sh \
        && sdk install gradle 7.6 \
        && sdk install java 22.3.r19-grl \
        && sdk use java 22.3.r19-grl \
        && gu install native-image'

COPY . .

RUN bash -c 'source ~/.sdkman/bin/sdkman-init.sh && gradle nativeCompile'

FROM gcr.io/distroless/static:nonroot

COPY --from=builder /app/build/native/nativeCompile/demo /bin/demo
CMD ["/bin/demo"]
