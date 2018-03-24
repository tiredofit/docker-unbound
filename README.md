# hub.docker.com/r/tiredofit/unbound

[![Build Status](https://img.shields.io/docker/build/tiredofit/unbound.svg)](https://hub.docker.com/r/tiredofit/unbound)
[![Docker Pulls](https://img.shields.io/docker/pulls/tiredofit/unbound.svg)](https://hub.docker.com/r/tiredofit/unbound)
[![Docker Stars](https://img.shields.io/docker/stars/tiredofit/unbound.svg)](https://hub.docker.com/r/tiredofit/unbound)
[![Docker Layers](https://images.microbadger.com/badges/image/tiredofit/unbound.svg)](https://microbadger.com/images/tiredofit/unbound)
[![Image Size](https://img.shields.io/microbadger/image-size/tiredofit/unbound.svg)](https://microbadger.com/images/tiredofit/unbound)

# Introduction

Dockerfile to build an [Unbound DNS Cache](https://unbound.net) container image for quicker DNS lookups, mostly useful for mail servers, and other services that repeatedly rely on name resolution.

* This Container uses a [customized Alpine Linux base](https://hub.docker.com/r/tiredofit/alpine) which includes [s6 overlay](https://github.com/just-containers/s6-overlay) enabled for PID 1 Init capabilities, [zabbix-agent](https://zabbix.org) for individual container monitoring, Cron also installed along with other tools (bash,curl, less, logrotate, nano, vim) for easier management. It also supports sending to external SMTP servers..



[Changelog](CHANGELOG.md)

# Authors

- [Dave Conroy](https://github.com/tiredofit/)

# Table of Contents

- [Introduction](#introduction)
    - [Changelog](CHANGELOG.md)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Configuration](#configuration)
    - [Data Volumes](#data-volumes)
    - [Environment Variables](#environmentvariables)   
- [Maintenance](#maintenance)
    - [Shell Access](#shell-access)
   - [References](#references)

# Prerequisites

This image doesn't do much on it's own, you must use a complemenary service to pass messages or data to it via port 783.


# Installation

Automated builds of the image are available on [Registry](https://hub.docker.com/tiredofit/unbound) and is the recommended method of installation.


```bash
docker pull hub.docker.com/tiredofit/unbound:(imagetag)
```

The following image tags are available:
* `latest` - Most recent release of Unbound w/ Alpine Linux

# Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [docker-compose.yml](examples/docker-compose.yml) that can be modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabilities of this image.
* Map [persistent storage](#data-volumes) for access to configuration and data files for backup.


# Configuration

### Data-Volumes

No files are required for persistent storage.

### Environment Variables

Along with the Environment Variables from the [Base image](https://hub.docker.com/r/tiredofit/alpine), below is the complete list of available options that can be used to customize your installation.

| Parameter | Description | 
|-----------|-------------|
| `DO_IPV6` | Enable or disable ipv6. Default: `yes` - Possible Values: `yes`,`no` |
| `DO_IPV4` | Enable or disable ipv4. Default: `yes` - Possible Values: `yes`,`no` |
| `DO_UDP` | Enable or disable udp. Default: `yes` - Possible Values: `yes`,`no` |
| `DO_TCP` | Enable or disable tcp. Default: `yes` - Possible Values: `yes,`no` |
| `VERBOSITY` | Verbosity number, 0 is least verbose. Default: `0` |
| `SO_RCVBUFF` | Buffer size for UDP port 53 incoming. Default: `0` |
| `SO_SNDBUF` | Buffer size for UDP port 53 outgoing. Default: `0` |
| `SO_REUSEPORT` | Use SO_REUSEPORT to distribute queries over threads. Default: `no` - Possible Values: `yes, no` |
| `EDNS_BUFFER_SIZE EDNS` | Reassembly buffer to advertise to UDP peers. Default: `4096` |
| `MSG_CACHE_SIZE` | The amount of memory to use for the message cache. Plain value in bytes or you can append k, m or G. Default: `4m` |
| `RRSET_CACHE_SIZE` | The amount of memory to use for the RRset cache. Plain value in bytes or you can append k, m or G. Default: `4m` |
| `CACHE_MIN_TTL` | The time to live (TTL) value lower bound, in seconds. Default: `0` |
| `CACHE_MAX_TTL` | The time to live (TTL) value cap for RRsets and messages in the cache. Items are not cached for longer. In seconds. Default: - `86400`  |
| `CACHE_MAX_NEGATIVE_TTL` | The time to live (TTL) value cap for negative responses in the cache. Default: `3600`  |
| `HIDE_IDENTITY` | Enable to not answer id.server and hostname.bind queries. Default: `no` - Possible Values: `yes`, `no` |
| `HIDE_VERSION` | Enable to not answer version.server and version.bind queries. Default: `no` - Possible Values: `yes`, `no` | 


### Networking

| Port | Description |
|-----------|-------------|
| `53` | Listening Port |

# Maintenance

#### Shell Access

For debugging and maintenance purposes you may want access the containers shell. 

```bash
docker exec -it (whatever your container name is e.g. unbound) bash
```

# References

* https://unbound.net



