# create an environment to build the jar
FROM maven:3-jdk-8 AS build

# place to build and run app from
ENV APPHOME /app/
WORKDIR ${APPHOME}

# prefetch dependencies
ADD pom.xml $APPHOME
RUN mvn verify -DskipTests

# copy across source
COPY src/main/ ${APPHOME}/src/main/

# build the jar
RUN mvn package

# new environment, forget the rest
FROM java:8-alpine

# default version for jar
ARG version=1.0-SNAPSHOT

# only copy the jar across from the build environment (makes for smaller images)
ENV APPHOME /app/
COPY --from=build ${APPHOME}/target/simple-logger-${version}-jar-with-dependencies.jar ${APPHOME}/simple-logger.jar

# default command to run when starting the container
WORKDIR ${APPHOME}
ENTRYPOINT java -jar simple-logger.jar
CMD []



