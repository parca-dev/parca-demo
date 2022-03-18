# rustlang/rust:nightly-slim as of 09.02.2022
# https://hub.docker.com/layers/rustlang/rust/nightly-slim/images/sha256-9be730883bf4f0fa12a126e233970d41901f3fe737aaa325073f09e85812e642?context=explore
# using the nightly build to be able to specify [profile.*.rustflags]
# feature will be there with 1.60.0
FROM docker.io/rustlang/rust@sha256:9be730883bf4f0fa12a126e233970d41901f3fe737aaa325073f09e85812e642

WORKDIR /usr/src/parca-demo
COPY . .

RUN cargo build --release

CMD ["./target/release/rust"]
