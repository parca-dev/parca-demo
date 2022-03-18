FROM debian:stable as builder
RUN apt-get update && apt-get install build-essential -y

ARG GCC_FLAGS

WORKDIR /app

COPY main.cpp .

RUN g++ ${GCC_FLAGS} -o parca-demo main.cpp

FROM debian:stable-slim as runner
RUN apt-get update && apt-get install libc6-dbg libstdc++6-10-dbg -y

COPY --from=builder /app/parca-demo .

CMD ["./parca-demo"]
