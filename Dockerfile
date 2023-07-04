#
# Exit code example
# A docker container with an example of exiting gracefully with an exit code that is not 137
#
# https://github.com/GameServerManagers/docker-linuxgsm
#

FROM ubuntu:22.04

LABEL maintainer="Daniel Gibbs <me@danielgibbs.co.uk>"
ENV DEBIAN_FRONTEND noninteractive
ENV TERM=xterm
ENV USERNAME=linuxgsm
ENV UID=1000
ENV GID=1000

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

## Install Base Requirements
RUN echo "**** Install Base Requirements ****" \
    && apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository multiverse \
    && apt-get update \
    && apt-get install -y \
    gosu \
    # Docker Extras
    iproute2 \
    iputils-ping \
    nano \
    vim \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && rm -rf /var/tmp/*

WORKDIR /app
ARG CACHEBUST=1
RUN echo "$CACHEBUST"

COPY entrypoint.sh /app/entrypoint.sh
COPY hello-world.sh /app/hello-world.sh

RUN date > /build-time.txt

ENTRYPOINT ["/bin/bash", "/app/entrypoint.sh"]
