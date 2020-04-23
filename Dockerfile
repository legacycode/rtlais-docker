FROM debian:buster-slim

ARG RTLSDR_VERSION=master
ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.schema-version="1.0" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.name="legacycode/rtlais" \
  org.label-schema.description="A Docker image based on Debian Linux ready to run any rtl_sdr command!" \
  org.label-schema.usage="https://hub.docker.com/r/legacycode/rtlais" \
  org.label-schema.url="https://hub.docker.com/r/legacycode/rtlais" \
  org.label-schema.vcs-url="https://github.com/legacycode/rtlais-docker" \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.version=$rtlais_VERSION \
  maintainer="info@legacycode.org"

WORKDIR /tmp

RUN apt-get update --yes \
  && apt-get install --no-install-recommends --yes \
    build-essential=12.6 \
    ca-certificates=20190110 \
    git=1:2.20.1-2+deb10u3 \
    libc6-dev=2.28-10 \
    librtlsdr-dev=0.6-1 \
    libusb-1.0-0-dev=2:1.0.22-2 \
    pkg-config=0.29-6 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone --branch add-static-flag https://github.com/legacycode/rtl-ais.git && \
    cd rtl-ais && \
    make && \
    cp /tmp/rtl-ais/rtl_ais /usr/bin && \
    rm -rf /tmp/rtl-ais
