FROM golang:1.17-bullseye as builder

ARG GO_BUILD_FLAGS

WORKDIR /app

COPY main.go .
COPY go.mod .

ENV CGO_ENABLED=1
RUN go build ${GO_BUILD_FLAGS} -v -o parca-demo .

FROM debian:stable-slim as runner
RUN apt-get update && apt-get install libc6-dbg -y

COPY --from=builder /app/parca-demo .

CMD ["./parca-demo"]
