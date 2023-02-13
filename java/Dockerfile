FROM docker.io/gradle:7.3.2-jdk11 AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon

FROM docker.io/debian:11

EXPOSE 8080

RUN mkdir /app

# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get install -y --no-install-recommends openjdk-11-jre-headless openjdk-11-dbg && \
    rm -rf /var/lib/apt/lists/*

COPY --from=build /home/gradle/src/build/libs/demo-0.0.1-SNAPSHOT.jar /app/demo.jar
ADD https://github.com/parca-dev/perf-map-agent/releases/download/v0.0.1/libperfmap.so /app/libperfmap.so

ENTRYPOINT ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseContainerSupport", "-XX:+PreserveFramePointer", "-agentpath:/app/libperfmap.so", "-Djava.security.egd=file:/dev/./urandom", "-jar","/app/demo.jar"]
