FROM docker.io/golang:1.17-bullseye as builder

ARG GO_BUILD_FLAGS

WORKDIR /app

COPY main.go .
COPY go.mod .

ENV CGO_ENABLED=1
RUN go build ${GO_BUILD_FLAGS} -v -o parca-demo .

FROM docker.io/debian:stable-slim as runner

# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get -y --no-install-recommends install libc6-dbg && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /app/parca-demo /bin

CMD ["/bin/parca-demo"]
