1. Does openshift SDN support ivp6
> No, work on ipv6 support for the SDN will not happen until OVN replaces OVS several versions from now.  calico is an option for this.

2. Can i only allow 53 udp not tcp for openshift cluster nodes ?
> ocp uses 8053 by default from > 3.3 version.   needs tcp/udp both on 8053 port, no need 53
