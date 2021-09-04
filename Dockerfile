FROM tiredofit/alpine:3.14
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

### Disable Features from Base Image
ENV CONTAINER_ENABLE_MESSAGING=FALSE

### Install Dependencies
RUN set -x && \
    addgroup -g 5353 unbound && \
    adduser -S -D -H -h /var/spool/postfix -s /sbin/nologin -G unbound -u 5353 unbound && \
    apk update && \
    apk upgrade && \
    apk add -t .unbound-run-deps \
               unbound \
               && \
    rm -rf /var/cache/apk/*

### Networking Configuration
EXPOSE 53

### Add Files
ADD install /
