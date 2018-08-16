### WIP  do your own research

1. use xfs filesytem with ftype=1 not ftype=0
2. Docker storage driver = overlay2 .   
3. Verifying correct Maximum Transmission Unit (MTU) size





















> From compliance point of view are indexes in EFK seperated by Namespace?   
Search gaurd plugin in kibana is used for multitenancy and also indexes created w.r.t namespaces/projects!





> Docker Storage can be backed by one of two options. The first is a thin pool logical volume with device mapper, the second, since Red Hat Enterprise Linux version 7.4, is an overlay2 file system. The overlay2 file system is generally recommended due to the ease of setup and increased performance.

> MTU size 
Compare . `ip link show eth0` .  vs . `/etc/origin/node/node-config.yaml` .  mtu size



