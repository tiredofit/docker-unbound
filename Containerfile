# SPDX-FileCopyrightText: © 2025 Nfrastack <code@nfrastack.com>
#
# SPDX-License-Identifier: MIT

ARG     \
        BASE_IMAGE \
        DISTRO \
        DISTRO_VARIANT

FROM ${BASE_IMAGE}:${DISTRO}_${DISTRO_VARIANT}

LABEL \
        org.opencontainers.image.title="Unbound" \
        org.opencontainers.image.description="Caching Domain Name Resolver" \
        org.opencontainers.image.url="https://hub.docker.com/r/nfrastack/unbound" \
        org.opencontainers.image.documentation="https://github.com/nfrastack/container-unbound/blob/main/README.md" \
        org.opencontainers.image.source="https://github.com/nfrastack/container-unbound.git" \
        org.opencontainers.image.authors="Nfrastack <code@nfrastack.com>" \
        org.opencontainers.image.vendor="Nfrastack <https://www.nfrastack.com>" \
        org.opencontainers.image.licenses="MIT"

ARG     \
        UNBOUND_REPO_URL \
        UNBOUND_VERSION

COPY CHANGELOG.md /usr/src/container/CHANGELOG.md
COPY LICENSE /usr/src/container/LICENSE
COPY README.md /usr/src/container/README.md

ENV \
    UNBOUND_VERSION=${UNBOUND_VERSION:-"release-1.23.1"} \
    UNBOUND_REPO_URL=${UNBOUND_REPO_URL:-"https://github.com/NLnetLabs/unbound"} \
    CONTAINER_ENABLE_SCHEDULING=TRUE \
    IMAGE_NAME="nfrastack/unbound" \
    IMAGE_REPO_URL="https://github.com/nfrastack/container-unbound/"

RUN echo "" && \
    UNBOUND_BUILD_DEPS_ALPINE=" \
                                bison \
                                build-base \
                                expat-dev \
                                flex \
                                hiredis-dev \
                                libevent-dev \
                                libmnl-dev \
                                libsodium-dev \
                                linux-headers \
                                nghttp2-dev \
                                openssl-dev \
                                protobuf-c-dev \
                                python3-dev \
                                swig \
                               " \
                               && \
    UNBOUND_RUN_DEPS_ALPINE=" \
                                bind-tools \
                                ldns-tools \
                                dnssec-root \
                                expat \
                                hiredis \
                                libevent \
                                libmnl \
                                libsodium \
                                nghttp2 \
                                openssl \
                                protobuf-c \
                            " \
                            && \
    \
    source /container/base/functions/container/build && \
    container_build_log && \
    create_user unbound 5353 unbound 5353 /var/lib/unbound && \
    package update && \
    package upgrade && \
    package install \
                        UNBOUND_BUILD_DEPS \
                        UNBOUND_RUN_DEPS \
                        && \
    \
    clone_git_repo "${UNBOUND_REPO_URL}" "${UNBOUND_VERSION}" && \
    export CFLAGS="$CFLAGS -flto=auto" && \
    export LDFLAGS="-lssl -lcrypto" && \
    PYTHON_VERSION=3 ./configure \
                        --build="$CBUILD" \
                        --host="$CHOST" \
                        --prefix=/usr \
                        --sysconfdir=/etc \
                        --mandir=/usr/share/man \
                        --localstatedir=/var \
                        --with-username=unbound \
                        --with-run-dir="" \
                        --with-pidfile="" \
                        --with-rootkey-file=/usr/share/dnssec-root/trusted-key.key \
                        --with-libevent \
                        --with-pthreads \
		                --enable-relro-now \
                        --disable-dsa \
                        --disable-gost \
                        --disable-rpath \
                        --disable-static \
                        --enable-cachedb \
                        --enable-dnscrypt \
                        --enable-dnstap \
                        --enable-ipset \
                        --enable-pie \
                        --with-dynlibmodule \
                        --with-libhiredis \
                        --with-libnghttps2 \
                        --with-pyunbound \
                        --with-ssl \
                        && \
    \
    sed -i -e '/^LIBS=/s/-lpython.*[[:space:]]/ /' Makefile && \
    make -j$(nproc)&& \
    make install && \
    \
    mkdir -p \
        /container/data/unbound \
        && \
    curl -sSL https://www.internic.net/domain/named.cache -o /container/data/unbound/named.cache && \
    mv /etc/unbound/unbound.conf /container/data/unbound/unbound.conf && \
    chown -R unbound:unbound /container/data/unbound && \
    \
    package remove \
                    UNBOUND_BUILD_DEPS \
                    && \
    package cleanup

EXPOSE \
        53/udp \
        53/tcp

COPY rootfs /
