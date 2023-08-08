FROM quay.io/quarkus/ubi-quarkus-graalvmce-builder-image:22.3-java17 AS builder

WORKDIR /project

COPY . .

RUN ./mvnw install -Dnative

FROM quay.io/quarkus/quarkus-micro-image:2.0

COPY --from=builder /project/target/code-with-quarkus-1.0.0-SNAPSHOT-runner /bin/quarkus-graal
CMD ["/bin/quarkus-graal"]
