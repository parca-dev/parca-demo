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
        && sdk install gradle 8.2 \
        && sdk install java 23.0.1.r17-nik \
        && sdk use java 23.0.1.r17-nik'

COPY . .

RUN bash -c 'source ~/.sdkman/bin/sdkman-init.sh && gradle dependencies && gradle nativeCompile'

FROM gcr.io/distroless/cc:nonroot

COPY --from=builder /app/build/native/nativeCompile/springboot-graal /bin/springboot-graal
CMD ["/bin/springboot-graal"]
