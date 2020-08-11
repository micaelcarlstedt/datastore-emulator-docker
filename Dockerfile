# Version. Set --build-arg when building.
ARG GCLOUD_SDK_VERSION

# Use google cloud sdk
FROM google/cloud-sdk:$GCLOUD_SDK_VERSION
LABEL maintainer="Micael Carlstedt"

# Install Java 8 for Datastore emulator
RUN apk add --update --no-cache openjdk8-jre &&\
    gcloud components install cloud-datastore-emulator beta --quiet

# Volume to persist Datastore data
VOLUME /opt/data

COPY start-datastore .

EXPOSE 8081

ENTRYPOINT ["./start-datastore"]
