# This demo helps you deploy letsencrypt certs to your openshift-master web  console

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

