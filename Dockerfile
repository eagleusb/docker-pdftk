# syntax=docker/dockerfile:latest
FROM alpine:latest

# TODO: update to open containers labels
LABEL org.label-schema.name="docker-pdftk" \
  org.label-schema.description="pdftk server compiled for alpine >3.8" \
  org.label-schema.vcs-ref="latest" \
  org.label-schema.vcs-url="https://github.com/eagleusb/docker-pdftk" \
  org.label-schema.schema-version="1.0"

ENV PDFTK_VERSION="2.02"

WORKDIR /workspace

RUN apk add --force-broken-world --no-cache \
  make tar unzip \
  g++6 gcc6-java libgcj6

RUN wget \
  https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/pdftk-${PDFTK_VERSION}-src.zip && \
  unzip pdftk-*.zip && \
  rm pdftk-*.zip

COPY pdftk/Makefile.alpine /workspace/pdftk-${PDFTK_VERSION}-dist/pdftk/

CMD []
HEALTHCHECK NONE
