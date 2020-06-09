FROM tiredofit/alpine:3.12-latest
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

### Disable Features from Base Image
ENV ENABLE_SMTP=FALSE

### Install Dependencies
RUN set -x && \
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
