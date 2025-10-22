FROM docker.io/swift:bookworm

WORKDIR /app

COPY . .

ENV MODE=release
RUN swift build -c ${MODE} && cp .build/${MODE}/ParcaDemo ./parca-demo

ENTRYPOINT ["./parca-demo"]
