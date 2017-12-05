
### For AWS Instance


```sh
yum install -y docker
sudo sed -i '/# INSECURE_REGISTRY/s/# INSECURE_REGISTRY/INSECURE_REGISTRY/' /etc/sysconfig/docker; sed -i s/--insecure-registry/--insecure-registry\ 172\.30\.0\.0\\/16/ /etc/sysconfig/docker
systemctl restart docker
/usr/local/bin/oc cluster up --public-hostname='cluster1.ck.osecloud.com' --routing-suffix='cluster1.ck.osecloud.com'
oc login -u system:admin
oc adm policy add-cluster-role-to-user cluster-admin admin
oc new-build https://github.com/debianmaster/java-welcome.git#ocp-java-welcome --context-dir=dockerfiles --name=tomcat-base3
```




Ex:-

```sh
oc cluster up --public-hostname=aws.ck.osecloud.com --routing-suffix='aws.ck.osecloud.com'  --use-existing-config=true
```
