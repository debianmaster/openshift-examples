
 
### Etcd Disks:
1) Fast disks are the most critical factor for etcd deployment performance and stability.
2) A slow disk will increase etcd request latency and potentially hurt cluster stability. Since etcd’s consensus protocol depends on persistently storing metadata to a log, a majority of etcd cluster members must write every request down to disk. Additionally, etcd will also incrementally checkpoint its state to disk so it can truncate this log. If these writes take too long, heartbeats may time out and trigger an election, undermining the stability of the cluster.
3) Suggested config    
  3.1) 500 sequential IOPS (a typical local SSD or a high performance virtualized block device) To measure actual sequential IOPS, we suggest using a disk benchmarking tool such as diskbench or fio.
etcd requires only modest disk bandwidth but more disk bandwidth buys faster recovery times when a failed member has to catch up with the cluster. Typically 10MB/s will recover 100MB data within 15 seconds. For large clusters, 100MB/s or higher is suggested for recovering 1GB data within 15 seconds.    
  3.2) If using spinning disk, get the fastest disks possible (15,000 RPM). Using RAID 0 is also an effective way to increase disk speed, for both spinning disks and SSD. With at least three cluster members, mirroring and/or parity variants of RAID are unnecessary; etcd's consistent replication already gets high availability.


soruce: https://github.com/coreos/etcd/blob/master/Documentation/op-guide/hardware.md#hardware-recommendations
