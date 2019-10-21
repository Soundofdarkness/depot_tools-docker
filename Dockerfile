FROM ubuntu:latest

LABEL maintainer="Soundofdarkness"
LABEL description="Docker image containing chromium depot_tools"

WORKDIR /opt/depot_tools
ENV PATH "$PATH:/opt/depot_tools"

RUN apt-get update && apt-get install -y git curl python \
    && rm -rf /var/lib/apt/lists/* \
    && git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git . \
    && gclient

ENTRYPOINT [ "gclient" ]