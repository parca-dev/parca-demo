FROM rust:slim

WORKDIR /usr/src/parca-demo
COPY . .

RUN cargo build

CMD ["./target/debug/rust"]
