# nfrastack/container-unbound

## About

This repository will build a container for [Unbound](https://www.unbound.net). A validating, recursive, caching DNS Resolver.

* Auto Configuration Support

## Maintainer

- [Nfrastack](https://www.nfrastack.com)

## Table of Contents

- [About](#about)
- [Maintainer](#maintainer)
- [Table of Contents](#table-of-contents)
- [Installation](#installation)
  - [Prebuilt Images](#prebuilt-images)
  - [Quick Start](#quick-start)
  - [Persistent Storage](#persistent-storage)
- [Configuration](#configuration)
  - [Environment Variables](#environment-variables)
    - [Base Images used](#base-images-used)
    - [Core Configuration](#core-configuration)
    - [Virus Definitions Configuration](#virus-definitions-configuration)
    - [Virus Scanning Settings](#virus-scanning-settings)
    - [Scanning Limits](#scanning-limits)
    - [Alerting Settings](#alerting-settings)
  - [Users and Groups](#users-and-groups)
  - [Networking](#networking)
- [Maintenance](#maintenance)
  - [Shell Access](#shell-access)
  - [Manual Definition Updates](#manual-definition-updates)
- [Support & Maintenance](#support--maintenance)
- [License](#license)

## Installation

### Prebuilt Images
Feature limited builds of the image are available on the [Github Container Registry](https://github.com/nfrastack/container-unbound/pkgs/container/container-unbound) and [Docker Hub](https://hub.docker.com/r/nfrastack/unbound).

To unlock advanced features, one must provide a code to be able to change specific environment variables from defaults. Support the development to gain access to a code.

To get access to the image use your container orchestrator to pull from the following locations:

```
ghcr.io/nfrastack/container-unbound:(image_tag)
docker.io/nfrastack/unbound:(image_tag)
```

Image tag syntax is:

`<image>:<optional tag>-<optional_distribution>_<optional_distribution_variant>`

Example:

`ghcr.io/nfrastack/container-unbound:latest` or

`ghcr.io/nfrastack/container-unbound:1.0` or

`ghcr.io/nfrastack/container-unbound:1.0-alpine` or

`ghcr.io/nfrastack/container-unbound:alpine`

* `latest` will be the most recent commit
* An otpional `tag` may exist that matches the [CHANGELOG](CHANGELOG.md) - These are the safest
* If it is built for multiple distributions there may exist a value of `alpine` or `debian`
* If there are multiple distribution variations it may include a version - see the registry for availability

Have a look at the container registries and see what tags are available.

#### Multi-Architecture Support

Images are built for `amd64` by default, with optional support for `arm64` and other architectures.

### Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [compose.yml](examples/compose.yml) that can be modified for your use.

* Map [persistent storage](#persistent-storage) for access to configuration and data files for backup.
* Set various [environment variables](#environment-variables) to understand the capabilities of this image.

### Persistent Storage

The following directories are used for configuration and can be mapped for persistent storage.

| Directory | Description                                    |
| --------- | ---------------------------------------------- |
| `/certs`  | (optional) Certificates                        |
| `/config` | (optional) Configuration Files                 |
| `/data`   | (optional) Root Hints and volatile information |
| `/logs`   | Log Files                                      |

### Environment Variables

#### Base Images used

This image relies on a customized base image in order to work.
Be sure to view the following repositories to understand all the customizable options:

| Image                                                   | Description |
| ------------------------------------------------------- | ----------- |
| [OS Base](https://github.com/nfrastack/container-base/) | Base Image  |

Below is the complete list of available options that can be used to customize your installation.

* Variables showing an 'x' under the `Advanced` column can only be set if the containers advanced functionality is enabled.

#### Core Configuration

| Parameter            | Description                                                            | Default               | Advanced |
| -------------------- | ---------------------------------------------------------------------- | --------------------- | -------- |
| `UNBOUND_SETUP_TYPE` | Auto Configure Configuration each startup - Set to `MANUAL` to disable | `AUTO`                |          |
| `DATA_PATH`          | Base Folder for Data Files                                             | `/data/`              |          |
| `CONFIG_PATH`        | Folder for Config Files                                                | `/config/`            |          |
| `CONFIG_FILE`        | Unbound configuration file                                             | `unbound.conf`        |          |
| `CUSTOM_CONFIG_PATH` | Additional User provided configuration path                            | `${DATA_PATH}/conf.d` |          |
| `LOG_PATH`           | Path for log files                                                     | `/logs/`              |          |
| `LOG_FILE`           | Log file name                                                          | `unbound.log`         |          |
| `LOG_LEVEL`          | Log verbosity level                                                    | `info`                |          |
|                      | `error`, `info`, `detailed`, `query` `algorithm` `client`              |                       |          |
| `LOG_TYPE`           | Log output type                                                        | `FILE`                |          |
| `UNBOUND_USER`       | User to run Unbound as                                                 | `unbound`             | x        |

#### Unbound Configuration

| Parameter                             | Description                         | Default                                                            | Advanced |
| ------------------------------------- | ----------------------------------- | ------------------------------------------------------------------ | -------- |
| `LISTEN_IP`                           | IP address to listen on             | `0.0.0.0`                                                          |          |
| `LISTEN_PORT`                         | Port to listen on                   | `53`                                                               |          |
| `ENABLE_IPV4`                         | Enable IPv4 support                 | `TRUE`                                                             |          |
| `ENABLE_IPV6`                         | Enable IPv6 support                 | `TRUE`                                                             |          |
| `ENABLE_TCP`                          | Enable TCP support                  | `TRUE`                                                             |          |
| `ENABLE_UDP`                          | Enable UDP support                  | `TRUE`                                                             |          |
| `ACCESS_CONTROL_OUTGOING_PORT_PERMIT` | Outgoing port permit range          | `10240-65535`                                                      | x        |
| `ACCESS_CONTROL`                      | Access control rules                | `0.0.0.0/0 allow`                                                  |          |
| `BUFFER_SIZE_MSG`                     | Message buffer size                 | `8192`                                                             | x        |
| `CACHE_SIZE_EDNS`                     | EDNS cache size                     | `4096`                                                             | x        |
| `CACHE_SIZE_MSG`                      | Message cache size                  | `32m`                                                              | x        |
| `CACHE_SIZE_RRSET`                    | RRset cache size                    | `64m`                                                              | x        |
| `CACHE_SLABS_MSG`                     | Message cache slabs                 | `4`                                                                | x        |
| `CACHE_TTL_MAX_NEGATIVE`              | Maximum negative cache TTL          | `10`                                                               | x        |
| `CACHE_TTL_MAX`                       | Maximum cache TTL                   | `86400`                                                            | x        |
| `CACHE_TTL_MIN`                       | Minimum cache TTL                   | `300`                                                              | x        |
| `DENY_ANY`                            | Deny ANY queries                    | `TRUE`                                                             |          |
| `HARDEN_DNSSEC_STRIPPED`              | Harden against DNSSEC stripped data | `TRUE`                                                             | x        |
| `HARDEN_GLUE`                         | Harden glue for DNSSEC              | `TRUE`                                                             | x        |
| `HARDEN_LARGE_QUERIES`                | Harden large queries                | `TRUE`                                                             | x        |
| `HARDEN_SHORT_BUFFER_SIZE`            | Harden short buffer size            | `TRUE`                                                             | x        |
| `LOG_QUERIES`                         | Log queries                         | `TRUE`                                                             |          |
| `LOG_REPLIES`                         | Log replies                         | `TRUE`                                                             |          |
| `LOG_SERVFAIL`                        | Log SERVFAIL responses              | `TRUE`                                                             |          |
| `LOG_TIME_ASCII`                      | Log time in ASCII format            | `TRUE`                                                             |          |
| `MINIMAL_RESPONSES`                   | Enable minimal responses            | `FALSE`                                                            | x        |
| `NO_QUERY_LOCALHOST`                  | Disallow queries from localhost     | `FALSE`                                                            | x        |
| `PREFETCH_KEY`                        | Enable prefetch key support         | `TRUE`                                                             | x        |
| `PREFETCH`                            | Enable prefetching                  | `TRUE`                                                             | x        |
| `QNAME_MINIMIZATION`                  | Enable QNAME minimization           | `TRUE`                                                             | x        |
| `ROOT_HINTS_FILE`                     | Root Hints File                     | `${DATA_PATH}/root.hints`                                          |          |
| `ROOT_HINTS_URI`                      | URI for root hints file             | `https://www.internic.net/domain/named.root`                       |          |
| `SO_BUFFER_RECEIVE`                   | Socket receive buffer size          | `""`                                                               | x        |
| `SO_BUFFER_SEND`                      | Socket send buffer size             | `""`                                                               | x        |
| `SO_REUSE_PORT`                       | Enable SO_REUSEPORT                 | `FALSE`                                                            | x        |
| `STATISTICS_CUMULATIVE`               | Enable cumulative statistics        | `TRUE`                                                             |          |
| `STATISTICS_EXTENDED`                 | Enable extended statistics          | `TRUE`                                                             |          |
| `STATISTICS_INTERVAL`                 | Statistics interval                 | `0`                                                                |          |
| `TARGET_FETCH_POLICY`                 | Target fetch policy                 | `2 1 0 0 0 0`                                                      | x        |
| `THREADS_QUERIES_PER`                 | Queries per thread                  | `1024`                                                             | x        |
| `THREADS`                             | Number of Unbound threads           | `1`                                                                | x        |
| `TRUST_ANCHOR`                        | DNSSEC trust anchor                 | `. DS 19036 8 2`                                                   |          |
|                                       |                                     | `49AAC11D7B6F6446702E54A1607371607A1A41855200FD2CE1CDDE32F24E8FB5` |          |

#### Forwarding Domain Configuration

| Parameter                    | Description                                  | Default | Advanced |
| ---------------------------- | -------------------------------------------- | ------- |
| --------                     |
| `FORWARD_DOMAIN_XX_NAME`     | Domain name to forward eg `example.com`      |         |
| `FORWARD_DOMAIN_XX_IP`       | IP address to forward queries to for _NAME   |         |
|                              | Add multiple by seperating with commas       |         |
| `FORWARD_DOMAIN_XX_FALLBACK` | Try Root Servers first then try values above | `no`    |

>> Exchange XX for 01,02,03 ....

#### Remote Control Configuration

| Parameter                    | Description                      | Default               | Advanced |
| ---------------------------- | -------------------------------- | --------------------- | -------- |
| `ENABLE_REMOTE_CONTROL`      | Enable Unbound remote control    | `TRUE`                |          |
| `REMOTE_CONTROL_LISTEN_IP`   | Remote control listen IP         | `127.0.0.1`           |          |
| `REMOTE_CONTROL_LISTEN_PORT` | Remote control listen port       | `8953`                |          |
| `TLS_CONTROL_CERT`           | TLS control certificate filename | `unbound_control.pem` |          |
| `TLS_CONTROL_KEY`            | TLS control key filename         | `unbound_control.key` |          |
| `TLS_CONTROL_PATH`           | Path for TLS control cert/key    | `/certs/`             |          |
| `TLS_SERVER_CERT`            | TLS server certificate filename  | `unbound_server.pem`  |          |
| `TLS_SERVER_KEY`             | TLS server key filename          | `unbound_server.key`  |          |
| `TLS_SERVER_PATH`            | Path for TLS server cert/key     | `/certs/`             |          |

## Users and Groups

| Type  | Name      | ID   |
| ----- | --------- | ---- |
| User  | `unbound` | 5353 |
| Group | `unbound` | 5353 |

### Networking

| Port   | Protocol | Description    |
| ------ | -------- | -------------- |
| `53`   | tcp      | Unbound Daemon |
| `53`   | udp      | Unbound Daemon |
| `8953` | udp      | Remote Control |

* * *

## Maintenance

### Shell Access

For debugging and maintenance, `bash` and `sh` are available in the container.

### Manual Definition Updates

Manual Definition Updates can be performed by entering the container and typing `update-now`

## Support & Maintenance

- For community help, tips, and community discussions, visit the [Discussions board](/discussions).
- For personalized support or a support agreement, see [Nfrastack Support](https://nfrastack.com/).
- To report bugs, submit a [Bug Report](issues/new). Usage questions will be closed as not-a-bug.
- Feature requests are welcome, but not guaranteed. For prioritized development, consider a support agreement.
- Updates are best-effort, with priority given to active production use and support agreements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
