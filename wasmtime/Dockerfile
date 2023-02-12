FROM docker.io/debian:11 AS build

ARG RUST_VERSION=1.67.0
ARG WASMTIME_VERSION=v5.0.0

WORKDIR /src

# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates curl xz-utils && \
    rm -rf /var/lib/apt/list/*

RUN curl --proto '=https' --tlsv1.2 -sSfo rust-init.sh https://sh.rustup.rs && \
    sh rust-init.sh -y --default-toolchain "${RUST_VERSION}" --profile minimal --target wasm32-wasi && \
    rm rust-init.sh

RUN DEB_ARCH="$(dpkg --print-architecture)" && \
    case "${DEB_ARCH}" in \
        'amd64') \
            ARCH='x86_64' \
            ;; \
        'arm64') \
            ARCH='aarch64' \
            ;; \
        's390x') \
            ARCH='s390x' \
            ;; \
        *) \
            printf "error: current architecture (%s) does not have a corresponding Wasmtime binary release\n" "${DEB_ARCH}" >&2; \
            exit 1; \
            ;; \
    esac && \
    curl -sSfOL "https://github.com/bytecodealliance/wasmtime/releases/download/${WASMTIME_VERSION}/wasmtime-${WASMTIME_VERSION}-${ARCH}-linux.tar.xz" && \
    tar xvf "wasmtime-${WASMTIME_VERSION}-${ARCH}-linux.tar.xz" -C /usr/local/bin --strip-component=1 "wasmtime-${WASMTIME_VERSION}-${ARCH}-linux/wasmtime" && \
    chmod +x /usr/local/bin/wasmtime && \
    rm "wasmtime-${WASMTIME_VERSION}-${ARCH}-linux.tar.xz"

COPY . .

RUN export PATH="${HOME}/.cargo/bin:${PATH}" && \
    cargo build --target wasm32-wasi --release

FROM docker.io/debian:11

WORKDIR /app

COPY --from=build /usr/local/bin/wasmtime /usr/local/bin
COPY --from=build /src/target/wasm32-wasi/release/demo.wasm .

ENTRYPOINT ["wasmtime", "run", "--jitdump", "demo.wasm"]
