FROM legacycode/rtlsdr:latest

LABEL org.label-schema.schema-version="1.0" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.name="legacycode/rtlais" \
  org.label-schema.description="A Docker image based on Alpine Linux ready to run any rtl_sdr command!" \
  org.label-schema.usage="https://hub.docker.com/r/legacycode/rtlais" \
  org.label-schema.url="https://hub.docker.com/r/legacycode/rtlais" \
  org.label-schema.vcs-url="https://github.com/legacycode/rtlais-docker" \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.version=$rtlais_VERSION \
  maintainer="info@legacycode.org"

WORKDIR /tmp

RUN git clone https://github.com/dgiardini/rtl-ais.git && \
    cd rtl-ais && \
    make && \
    cp /tmp/rtl-ais/rtl_ais /usr/bin && \
    rm -rf /tmp/rtl-ais
