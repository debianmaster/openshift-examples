
### Before you start 
> I have a Centos machine on AWS with public ip 34.209.8.118  and port 8443 is open to public
> Replace 34.209.8.118 with your pubcli ip.  


### Quick start
> All you need is `docker` and `oc` binary

```sh
sudo su
yum install docker wget -y
sed -i '/OPTIONS=.*/c\OPTIONS="--selinux-enabled --insecure-registry 172.30.0.0/16"' /etc/sysconfig/docker

systemctl restart docker

docker ps

wget https://github.com/openshift/origin/releases/download/v3.7.0/openshift-origin-client-tools-v3.7.0-7ed6862-linux-64bit.tar.gz

tar -xvf tar -xvf openshift-origin-client-tools-v3.7.0-7ed6862-linux-64bit.tar.gz
mv openshift-origin-client-tools-v3.7.0-7ed6862-linux-64bit/oc /usr/bin/

oc cluster up --public-hostname='aws.ck.osecloud.com' --routing-suffix='aws.ck.osecloud.com'
OR
openshift start --public-master='https://34.209.8.118.nip.io:8443' --master='https://172.31.35.206:8443' --listen='https://0.0.0.0:8443'
```

> That's all  hit   https://34.209.8.118.nip.io:8443/   with   user/password     developer/developer


