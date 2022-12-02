FROM docker.io/golang:1.17-alpine

ARG GO_BUILD_FLAGS

WORKDIR /app

COPY main.go .
COPY go.mod .

RUN go build ${GO_BUILD_FLAGS} -v -o parca-demo .

ENTRYPOINT ["./parca-demo"]
