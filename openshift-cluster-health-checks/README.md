# Host checks
> verify enough storage on  /var/lib/docker  &  /var/lib/origin/openshift.local.volumes
```
ansible all -a "df -hT"  
```
> verify storage driver, Logging Driver , Root Dir and filesystem for docker
```sh
 ansible all -a "docker info" | grep Storage
 ansible all -a "docker info" | grep Logging
 ansible all -a "docker info" | grep Root
 ansible all -a "docker info" | grep Filesystem
 ```
> kubelet args
```sh
 ansible all -a "cat /etc/origin/node/node-config.yaml" grep -A 15  kubeletArguments

 ```


```sh  
ansible all -a "cat /proc/sys/net/ipv4/ip_forward"  #should be 1
ansible all -a "cat /etc/sysconfig/network-scripts/ifcfg-eth0" | grep NM_CONTROLLED  #should be YES
ansible all -a "cat /etc/sysconfig/network-scripts/ifcfg-eth0" | grep PEERDNS  #shuold be NO
ansible all -a "sysctl net.ipv4.ip_forward"
ansible all -a "sysctl net.ipv6.conf.all.disable_ipv6"  #should be disabled
ansible all -a "cat /proc/sys/kernel/random/entropy_avail"  #should be > 2683

```
# Nodes
```sh
oc get nodes
oc get nodes --show-labels
oc adm diagnostics
oc get storageclass
```

# Registry health
```
oc -n default get deploymentconfigs/docker-registry
oc new-project validate
oc new-app cakephp-mysql-example
oc logs -f bc/cakephp-mysql-example
oc get pods
oc delete project validate
```


# ETCD
> On master
```sh
source /etc/etcd/etcd.conf
etcdctl2 --cert-file=$ETCD_PEER_CERT_FILE --key-file=$ETCD_PEER_KEY_FILE \
  --ca-file=/etc/etcd/ca.crt --endpoints=$ETCD_LISTEN_CLIENT_URLS cluster-health
```


# Router
```sh
oc -n default get deploymentconfigs/router
oc get pods -n default -o wide
```

# SDN
> On all nodes
```sh
ansible all -a "dig +short docker-registry.default.svc.cluster.local"
ansible all -a "dig +short docker-registry.default.svc"
ansible all -a "ping -c 1 redhat.com"
ansible all -a "ping -c 1 apps.example.com"
ansible all -a "ip link show eth0"
ansible all -a "curl -ks https://docker-registry.default.svc.cluster.local:5000/healthz"
ansible all -a "curl -ks https://docker-registry.default.svc:5000/healthz"
```

# Host
> on bastion
```sh
ansible all -a "docker info"
ansible all -a "lsblk"
ansible all -a "cat /etc/sysconfig/docker"
ansible all -a "timedatectl"
ansible all -m shell -a "/usr/bin/needs-restarting -r"
```

# POD checks
```sh
oc new-app centos/httpd-24-centos7~https://github.com/sclorg/httpd-ex
oc rsh <pod>
curl -kv https://docker-registry.default.svc.cluster.local:5000/healthz  #from inside pod
```
