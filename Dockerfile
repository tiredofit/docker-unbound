FROM tiredofit/alpine:3.6
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

### Disable Features from Base Image
   ENV ENABLE_CRON=FALSE \
       ENABLE_SMTP=FALSE

### Install Dependencies
   RUN apk update && \
       apk add \
           unbound && \

### Configure Unbound
       curl ftp://ftp.internic.net/domain/named.cache > /etc/unbound/root.hints


### Add Files
   ADD install /

### Networking Configuration
   EXPOSE 53
