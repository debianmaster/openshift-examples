
### Before you start 
> I have a Centos machine on AWS with public ip 34.209.8.118  and port 8443 is open to public
> Replace 34.209.8.118 with your pubcli ip.  


### Quick start
> All you need is `docker` and `oc` binary

```sh
$ sudo su
$ yum install docker wget -y
$ sed -i '/OPTIONS=.*/c\OPTIONS="--selinux-enabled --insecure-registry 172.30.0.0/16"' /etc/sysconfig/docker
$ systemctl restart docker
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
$ wget https://github.com/openshift/origin/releases/download/v1.5.0/openshift-origin-client-tools-v1.5.0-031cbe4-linux-64bit.tar.gz
$ tar -xvf openshift-origin-client-tools-v1.5.0-031cbe4-linux-64bit.tar.gz
$ mv  openshift-origin-client-tools-v1.5.0-031cbe4-linux-64bit/oc /usr/bin/oc
$ oc cluster up --public-hostname='34.209.8.118.nip.io' --routing-suffix='34.209.8.118.nip.io'
```

> That's all  hit   https://34.209.8.118.nip.io:8443/   with   user/password     developer/developer


