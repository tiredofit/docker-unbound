## 2.7.99 2025-08-15 <dave at tiredofit dot ca>

Add EOL for tiredofit/unbound and notify of newer nfrastack/unbound image


## 2.7.1 2025-07-16 <dave at tiredofit dot ca>

   ### Added
      - Unbound 1.23.1


## 2.7.0 2025-07-09 <dave at tiredofit dot ca>

   ### Added
      - Add FORWARD_DOMAIN_XX_FALLBACK (yes|no) to support falling back to unbound resolver if host does not respond


## 2.6.3 2025-07-09 <dave at tiredofit dot ca>

   ### Added
      - Add FORWARD_DOMAIN_XX_(NAME|IP) support to override specific domain names to use a specific nameserver instead of unbound


## 2.6.2 2025-04-24 <dave at tiredofit dot ca>

   ### Added
      - Unbound 1.23.0
      - Pin to tiredofit/alpine:7.10.29


## 2.6.1 2025-02-14 <dave at tiredofit dot ca>

   ### Added
      - Pin to tiredofit/alpine:3.21-7.10.28


## 2.6.0 2025-02-14 <dave at tiredofit dot ca>

   ### Added
      - Add configurable ROOT_HINTS_URI environment variable to choose where to refresh root hints from
      - Include Root hints on build and update only if 30 days or older

   ### Changed
      - Small amount of polish cleaning up old and weird variables


## 2.5.9 2024-12-07 <dave at tiredofit dot ca>

   ### Added
      - Pin to tiredofit/alpine:3.21-7.10.24


## 2.5.8 2024-10-17 <dave at tiredofit dot ca>

   ### Added
      - Unbound 1.22.0
      - tiredofit/alpine:3.20-7.10.16


## 2.5.7 2024-10-03 <dave at tiredofit dot ca>

   ### Changed
      - Fix for 2.5.6


## 2.5.6 2024-10-03 <dave at tiredofit dot ca>

   ### Added
      - Unbound 1.21.1
      - Pin to tiredofit/alpine:7.10.15


## 2.5.5 2024-08-15 <dave at tiredofit dot ca>

   ### Added
      - Unbound 1.21.0
      - Alpine 3.20 base


## 2.5.4 2024-05-10 <dave at tiredofit dot ca>

   ### Added
      - Unbound 1.20.0


## 2.5.3 2024-03-10 <dave at tiredofit dot ca>

   ### Added
      - Unbound 1.19.2


## 2.5.2 2024-02-13 <dave at tiredofit dot ca>

   ### Added
      - Unbound 1.19.1


## 2.5.1 2023-12-08 <dave at tiredofit dot ca>

   ### Added
      - Change base image to tiredofit/alpine:3.19


## 2.5.0 2023-08-30 <dave at tiredofit dot ca>

   ### Added
      - Unbound 1.18.0
      - Switch to using packaged version and start compiling from source


## 2.4.1 2023-05-10 <dave at tiredofit dot ca>

   ### Changed
      - Alpine 3.18 base


## 2.4.0 2022-12-01 <dave at tiredofit dot ca>

   ### Changed
      - Rework Dockerfile


## 2.3.7 2022-11-23 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.17 Base


## 2.3.6 2022-08-17 <dave at tiredofit dot ca>

   ### Changed
      - Switch to using exec to launch process


## 2.3.5 2022-05-24 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.16 base


## 2.3.4 2022-02-09 <dave at tiredofit dot ca>

   ### Changed
      - Rework to support new base image


## 2.3.3 2022-02-09 <dave at tiredofit dot ca>

   ### Changed
      - Refresh base image


## 2.3.2 2021-12-27 <dave at tiredofit dot ca>

   ### Changed
      - Minor fixup for Zabbix monitoring and creating temp certificates


## 2.3.1 2021-12-22 <dave at tiredofit dot ca>

   ### Changed
      - Patchup for fetching version via Zabbix


## 2.3.0 2021-12-22 <dave at tiredofit dot ca>

   ### Added
      - Add Zabbix monitoring and certificate building


## 2.2.4 2021-12-16 <dave at tiredofit dot ca>

   ### Changed
      - Tweak for Zabbix autoregistration


## 2.2.3 2021-12-07 <dave at tiredofit dot ca>

   ### Added
      - Add Zabbix Auto agent registration for templates


## 2.2.2 2021-11-24 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.15 base


## 2.2.1 2021-10-25 <dave at tiredofit dot ca>

   ### Added
      - Add fluent-bit log parsing regular expressions


## 2.2.0 2021-09-04 <dave at tiredofit dot ca>

   ### Added
      - Create Unbound user ahead of package installer

   ### Changed
      - Change the way log rotation configuration is performed


## 2.1.4 2021-07-25 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.14 Base


## 2.1.3 2021-01-14 <dave at tiredofit dot ca>

   ### Changed
      - Alpine 3.13 Base         


## 2.1.2 2020-09-13 <dave at tiredofit dot ca>

   ### Added
      - Add a few more configuration options


## 2.1.1 2020-08-31 <dave at tiredofit dot ca>

   ### Changed
      - Fix Configuration building


## 2.1.0 2020-06-09 <dave at tiredofit dot ca>

   ### Added
      - Update to support tiredofit/alpine 5.0.0 base image


## 2.0.0 2020-06-07 <dave at tiredofit dot ca>

   ### Added
      - Rewrote entire image to support auto generated configuration
      - Alpine 3.12


## 1.2.1 2020-01-02 <dave at tiredofit dot ca>

   ### Changed
      - Additional changes to support new tiredofit/alpine base image


## 1.2.0 2019-12-29 <dave at tiredofit dot ca>

   ### Added
      - Update to support new tiredofit/alpine base image


## 1.1.2 2019-12-20 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.11 Base


## 1.1.1 2018-02-08 Dave Conroy <dave at tiredofit dot ca>

* Base bump to Alpine 3.9

## 1.1 2017-12-01 Dave Conroy <dave at tiredofit dot ca>

* Base bump to Alpine 3.7

## 1.0 2017-09-03 Dave Conroy <dave at tiredofit dot ca>

* Initial Release
* Alpine 3.6

