FROM alpine:latest
RUN apk add --no-cache bash
RUN apk add --no-cache curl
RUN mkdir -p /opt/app
RUN mkdir -p /opt/openshift-installations
VOLUME /opt/app
VOLUME /opt/openshift-installations
WORKDIR /opt/app