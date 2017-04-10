### Verified letsyncupt certs for a domain auth.xfc.io

```sh
cert1.pem  chain1.pem  fullchain1.pem  privkey1.pem
```
### Deploying certs and creating route

```sh
oc create route edge --service=auth --cert=fullchain1.pem --key=privkey1.pem  --hostname=auth.xfc.io
```
