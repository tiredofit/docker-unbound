ARG DISTRO="alpine"
ARG DISTRO_VARIANT="3.18"

FROM docker.io/tiredofit/${DISTRO}:${DISTRO_VARIANT}
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

ENV CONTAINER_ENABLE_MESSAGING=FALSE \
    IMAGE_NAME="tiredofit/unbound" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-unbound/"

RUN source /assets/functions/00-container && \
    set -x && \
    addgroup -g 5353 unbound && \
    adduser -S -D -H -h /var/spool/postfix -s /sbin/nologin -G unbound -u 5353 unbound && \
    package update && \
    package upgrade && \
    package install .unbound-run-deps \
               openssl \
               unbound \
               && \
    package cleanup

EXPOSE 53

COPY install /
