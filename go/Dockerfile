FROM golang:1.17-alpine

WORKDIR /app

COPY main.go .
COPY go.mod .

RUN go build -v -o parca-demo .

ENTRYPOINT ["./parca-demo"]
