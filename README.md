Unbound DNS Resolver based on Alpine

Environment Variables

| `DO_IPV6` | Enable or disable ipv6. Default: `yes` - Possible Values: `yes, no` |
| `DO_IPV4` | Enable or disable ipv4. Default: `yes` - Possible Values: `yes, no` |
| `DO_UDP` | Enable or disable udp. Default: `yes` - Possible Values: `yes, no` |
| `DO_TCP` | Enable or disable tcp. Default: `yes` - Possible Values: `yes, no` |
| `VERBOSITY` |Verbosity number, 0 is least verbose. Default: `0` - Possible Values: `` |
| `SO_RCVBUFF` |Buffer size for UDP port 53 incoming. Default: `0` - Possible Values: `` |
| `SO_SNDBUF` Buffer size for UDP port 53 outgoing. Default: `0` - Possible Values: `` |
| `SO_REUSEPORT` |Use SO_REUSEPORT to distribute queries over threads. Default: `no` - Possible Values: `yes, no` |
| `EDNS_BUFFER_SIZE EDNS` |reassembly buffer to advertise to UDP peers. Default: `4096` - Possible Values: `` |
| `MSG_CACHE_SIZE` | The amount of memory to use for the message cache. Plain value in bytes or you can append k, m or G. Default: `4m` - Possible Values: `` |
| `RRSET_CACHE_SIZE` | The amount of memory to use for the RRset cache. Plain value in bytes or you can append k, m or G. Default: `4m` - Possible Values: `` |
| `CACHE_MIN_TTL` | The time to live (TTL) value lower bound, in seconds. Default: `0` - Possible Values: `` |
| `CACHE_MAX_TTL` | The time to live (TTL) value cap for RRsets and messages in the cache. Items are not cached for longer. In seconds. Default: - `86400` - Possible Values: `` |
| `CACHE_MAX_NEGATIVE_TTL` | The time to live (TTL) value cap for negative responses in the cache. Default: `3600`, Possible Values: `` |
| `HIDE_IDENTITY` | Enable to not answer id.server and hostname.bind queries. Default: `no` - Possible Values: `yes, no` |
| `HIDE_VERSION` | Enable to not answer version.server and version.bind queries. Default: `no` - Possible Values: `yes`, `no` | 

