FROM debian:stable as builder
RUN apt-get update && apt-get install build-essential -y

ARG GCC_FLAGS

WORKDIR /app

COPY main.c .

RUN gcc ${GCC_FLAGS} -o parca-demo main.c

FROM debian:stable-slim as runner
RUN apt-get update && apt-get install libc6-dbg -y

COPY --from=builder /app/parca-demo .

CMD ["./parca-demo"]
