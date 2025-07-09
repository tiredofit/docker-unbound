ARG DISTRO="alpine"
ARG DISTRO_VARIANT="3.21"

FROM docker.io/tiredofit/${DISTRO}:${DISTRO_VARIANT}-7.10.31
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

ARG UNBOUND_VERSION

ENV UNBOUND_VERSION=${UNBOUND_VERSION:-"release-1.23.0"} \
    UNBOUND_REPO_URL="https://github.com/NLnetLabs/unbound" \
    CONTAINER_ENABLE_MESSAGING=FALSE \
    IMAGE_NAME="tiredofit/unbound" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-unbound/"

RUN source /assets/functions/00-container && \
    set -x && \
    addgroup -g 5353 unbound && \
    adduser -S -D -H -h /var/spool/postfix -s /sbin/nologin -G unbound -u 5353 unbound && \
    package update && \
    package upgrade && \
    package install .unbound-build-deps \
                        bison \
                        build-base \
                        expat-dev \
                        flex \
                        libevent-dev \
                        linux-headers \
                        openssl-dev \
                        protobuf-c-dev \
                        python3-dev \
                        swig \
                        && \
    package install .unbound-run-deps \
                        dnssec-root \
                        expat \
                        libevent \
                        openssl \
                        protobuf-c \
                        && \
    \
    clone_git_repo "${UNBOUND_REPO_URL}" "${UNBOUND_VERSION}" && \mkdir -p /usr/src/unbound && \
    export CFLAGS="$CFLAGS -flto=auto" && \
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
		--disable-static \
		--disable-rpath \
		--enable-dnstap \
		--with-ssl \
		--without-pythonmodule \
		--with-pyunbound && \
    \
	sed -i -e '/^LIBS=/s/-lpython.*[[:space:]]/ /' Makefile && \
	make -j$(nproc)&& \
    make install && \
    mkdir -p \
        /assets/unbound \
        && \
    curl -sSL https://www.internic.net/domain/named.cache -o /assets/unbound/named.cache && \
    chown -R unbound /assets/unbound && \
    package remove .unbound-install-deps && \
    package cleanup

EXPOSE 53

COPY install /
