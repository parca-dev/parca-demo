# TODO(kakkoyun): To do try jlinks
FROM eclipse-temurin:19 as jre-build

RUN $JAVA_HOME/bin/jlink \
         --add-modules java.base \
        #  --strip-debug \
        #  --no-header-files \
         --compress=2 \
         --output /javaruntime

# $java --list-modules
# com.greetings
# java.base@9
# java.compiler@9
# java.datatransfer@9
# java.desktop@9
# java.logging@9
# java.management@9
# java.management.rmi@9
# java.naming@9
# java.prefs@9
# java.rmi@9
# java.scripting@9
# java.security.jgss@9
# java.security.sasl@9
# java.smartcardio@9
# java.xml@9
# java.xml.crypto@9
# jdk.accessibility@9
# jdk.charsets@9
# jdk.compiler@9
# jdk.crypto.cryptoki@9
# jdk.crypto.ec@9
# jdk.crypto.mscapi@9
# jdk.deploy@9
# jdk.dynalink@9
# jdk.internal.opt@9
# jdk.jartool@9
# jdk.javadoc@9
# jdk.jdeps@9
# jdk.jlink@9
# jdk.localedata@9
# jdk.management@9
# jdk.naming.dns@9
# jdk.naming.rmi@9
# jdk.scripting.nashorn@9
# jdk.security.auth@9
# jdk.security.jgss@9
# jdk.unsupported@9
# jdk.zipfs@9
# org.astro@1.0

FROM eclipse-temurin:19-jdk as builder

RUN apt-get update && apt-get install -y build-essential

WORKDIR /app

COPY DemoJNI.java DemoJNI.cpp Makefile ./

RUN make compile

# FROM eclipse-temurin:19-jre as runner
FROM debian:buster-slim as runner

ENV JAVA_HOME=/opt/java/openjdk
ENV PATH "${JAVA_HOME}/bin:${PATH}"
COPY --from=jre-build /javaruntime $JAVA_HOME

COPY --from=builder /app/DemoJNI.class .
COPY --from=builder /app/lib/libdemo.so /usr/lib

# "-XX:+UnlockExperimentalVMOptions", "-XX:+UseContainerSupport", "-XX:+PreserveFramePointer",
# "-agentpath:/app/libperfmap.so", "-Djava.security.egd=file:/dev/./urandom",
# --XX:+DebugNonSafepoints
CMD ["java", "-cp", ".", "-Djava.library.path=/usr/lib", "DemoJNI"]
