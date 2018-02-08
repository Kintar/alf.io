#
# alfio dockerfile.
#

# Pull base image.
FROM openjdk:jre-alpine

# COPY ./alfio-1.13.2-SNAPSHOT-boot.war /alf.io/
COPY ./alfio-1.13.2_20180126-SNAPSHOT-boot.war /alf.io/
COPY ./local.properties /alf.io/

# Define working directory.
WORKDIR /alf.io
RUN mkdir /alf.io/logs
ENV ALFIO_LOG_STDOUT_ONLY=true

VOLUME ["/alf.io/logs"]

ENTRYPOINT ["java", "-Dspring.profiles.active=dev" ,"-jar", "/alf.io/alfio-1.13.2_20180126-SNAPSHOT-boot.war", "--spring.config.location=/alf.io/local.properties"]

EXPOSE 8000

