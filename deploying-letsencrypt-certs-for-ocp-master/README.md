# Custom Wildcard Certificates for the OpenShift Router

> letsencrypt gives you following certs /keys after successful domain verficiation

```sh
cert1.pem  chain1.pem  fullchain1.pem  privkey1.pem
```

> OpenShift expect the private key in the certificate file. Thus we have to...

```
cp fullchain1.pem tls.crt
cat privkey1.pem >> tls.crt
```

```sh
date=`date +%y%m%d%H%M`
oc export secret router-certs -o yaml -n default> router-certs.backup.$date.yaml
oc delete secret router-certs -n default
oc secrets new router-certs tls.crt=tls.crt tls.key=privkey1.pem --type='kubernetes.io/tls' --confirm -n default
oc deploy dc/router --latest -n default
```


### To obtain certs


```sh
https://community.letsencrypt.org/t/installing-postfix-with-lets-encrypt-certificate-using-certbot-rhel7/20445
certonly
certbot certonly --standalone -d ck.osecloud.com  --email myemail@gmail.com or 
certbot certonly --standalone --webroot -w /var/www/html/ck.osecloud.com -d ck.osecloud.com  --email myemail@gmail.com -n
```
Or

```sh
# Terminal 1
docker run -p 443:443 -p 80:80 --rm -v /etc/letsencrypt/:/tmp --entrypoint "/bin/sh" -it certbot/certbot
certbot certonly --standalone -d ck.osecloud.com  --email 9chakri@gmail.com --agree-tos -n

# Terminal 2
docker cp e8f87af1e420:/etc/letsencrypt/archive /etc/letsencrypt/
```
