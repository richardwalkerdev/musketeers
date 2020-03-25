FROM alpine:latest
RUN apk add --no-cache bash
RUN mkdir -p /opt/app
WORKDIR /opt/app
VOLUME opt/app