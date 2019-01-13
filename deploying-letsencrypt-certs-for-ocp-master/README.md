


> Update inventory file
```
openshift_master_named_certificates=[{"certfile":"/etc/letsencrypt/archive/cloud.run9.io/fullchain1.pem","keyfile":"/etc/letsencrypt/archive/cloud.run9.io/privkey1.pem","cafile":"/etc/origin/master/ca-bundle.crt","names": ["cloud.run9.io"]}]
```
> Update master-config by running 
```
ansible-playbook /root/openshift-ansible/playbooks/openshift-master/config.yml
```



### To obtain certs

```sh
oc scale dc/router --replicas=0 -n default
```


```sh
git clone https://github.com/certbot/certbot
cd certbot/
./certbot-auto certonly -d cloud.run9.io --standalone -m 9chakri@gmail.com -n --agree-tos
```


### For router

> letsencrypt gives you following certs /keys after successful domain verficiation

```sh
cert1.pem  chain1.pem  fullchain1.pem  privkey1.pem
```



```sh
date=`date +%y%m%d%H%M`
oc export secret router-certs -o yaml -n default> router-certs.backup.$date.yaml
oc delete secret router-certs -n default
oc secrets new router-certs tls.crt=fullchain1.pem tls.key=privkey1.pem --type='kubernetes.io/tls' --confirm -n default
oc deploy dc/router --latest -n default
```


## latest
```sh
https://github.com/Neilpang/acme.sh/wiki/dns-manual-mode
```
