FROM tiredofit/alpine:3.11
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

### Disable Features from Base Image
   ENV ENABLE_CRON=FALSE \
       ENABLE_SMTP=FALSE

### Install Dependencies
   RUN set -x && \
       apk update && \
       apk add \
           unbound \
           && \

### Configure Unbound
       curl ftp://ftp.internic.net/domain/named.cache > /etc/unbound/root.hints

### Networking Configuration
   EXPOSE 53

### Add Files
   ADD install /
