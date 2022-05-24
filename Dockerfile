FROM docker.io/tiredofit/alpine:3.16
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

### Disable Features from Base Image
ENV CONTAINER_ENABLE_MESSAGING=FALSE \
    IMAGE_NAME="tiredofit/unbound" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-unbound/"

### Install Dependencies
RUN set -x && \
    addgroup -g 5353 unbound && \
    adduser -S -D -H -h /var/spool/postfix -s /sbin/nologin -G unbound -u 5353 unbound && \
    apk update && \
    apk upgrade && \
    apk add -t .unbound-run-deps \
               openssl \
               unbound \
               && \
    rm -rf /var/cache/apk/*

### Networking Configuration
EXPOSE 53

### Add Files
ADD install /
