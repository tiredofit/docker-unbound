# github.com/tiredofit/docker-unbound

[![Docker Pulls](https://img.shields.io/docker/pulls/tiredofit/unbound.svg)](https://hub.docker.com/r/tiredofit/unbound)
[![Docker Stars](https://img.shields.io/docker/stars/tiredofit/unbound.svg)](https://hub.docker.com/r/tiredofit/unbound)

## About

Dockerfile to build an [Unbound DNS Cache](https://unbound.net) container image for quicker DNS lookups, mostly useful for mail servers, and other services that repeatedly rely on name resolution.

* This Container uses a [customized Alpine Linux base](https://hub.docker.com/r/tiredofit/alpine) which includes [s6 overlay](https://github.com/just-containers/s6-overlay) enabled for PID 1 Init capabilities, [zabbix-agent](https://zabbix.org) for individual container monitoring, Cron also installed along with other tools (bash,curl, less, logrotate, nano) for easier management. It also supports sending to external SMTP servers..



[Changelog](CHANGELOG.md)

## Maintainer

- [Dave Conroy](https://github.com/tiredofit/)

## Table of Contents

- [Introduction](#introduction)
- [Authors](#authors)
- [Table of Contents](#table-of-contents)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [Quick Start](#quick-start)
- [Configuration](#configuration)
  - [Data-Volumes](#data-volumes)
  - [Environment Variables](#environment-variables)
  - [Networking](#networking)
- [Maintenance](#maintenance)
  - [Shell Access](#shell-access)
- [References](#references)

## Prerequisites and Assumptions

None.


## Installation

Automated builds of the image are available on [Docker Hub](https://hub.docker.com/r/tiredofit/unbound)


```bash
docker pull hub.docker.com/tiredofit/unbound:(imagetag)
```

Builds of the image are also available on the [Github Container Registry](https://github.com/tiredofit/docker-tiredofit/pkgs/container/docker-tiredofit) 
 
```
docker pull ghcr.io/tiredofit/docker-tiredofit:(imagetag)
``` 

The following image tags are available:
* `latest` - Most recent release of Unbound w/ Alpine Linux

### Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [docker-compose.yml](examples/docker-compose.yml) that can be modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabilities of this image.
* Map [persistent storage](#data-volumes) for access to configuration and data files for backup.


## Configuration

### Persistent Storage

No files are required for persistent storage.

### Environment Variables

Along with the Environment Variables from the [Base image](https://hub.docker.com/r/tiredofit/alpine), below is the complete list of available options that can be used to customize your installation.

| Parameter | Description | Default |
| --------- | ----------- | ------- |

### Networking

| Port | Description    |
| ---- | -------------- |
| `53` | Listening Port |

## Maintenance

### Shell Access

For debugging and maintenance purposes you may want access the containers shell.

```bash
docker exec -it (whatever your container name is e.g. unbound) bash
```

## References

* https://unbound.net



