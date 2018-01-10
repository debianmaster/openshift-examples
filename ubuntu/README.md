## Server setup
```sh
apt install docker.io -y
cat > /etc/docker/daemon.json <<EOF
{
  "insecure-registries" : ["172.30.0.0/16"]
}
EOF

systemctl restart docker
docker ps
```

```sh
wget https://github.com/openshift/origin/releases/download/v3.7.0/openshift-origin-client-tools-v3.7.0-7ed6862-linux-64bit.tar.gz
tar -xvf openshift-origin-client-tools-v3.7.0-7ed6862-linux-64bit.tar.gz
mv openshift-origin-client-tools-v3.7.0-7ed6862-linux-64bit/oc /usr/bin/
```

```sh
oc cluster up --public-hostname='cr.xfc.io' --routing-suffix='cr.xfc.io'
apt-get install software-properties-common
add-apt-repository ppa:certbot/certbot
apt-get update
apt-get install certbot
mkdir -p /var/www/cr.xfc.io
oc cluster down
certbot certonly --standalone -w /var/www/cr.xfc.io -d cr.xfc.io  --email 9chakri@gmail.com
/etc/letsencrypt/live/cr.xfc.io/
```

```sh
cat > patch.yaml <<EOF
servingInfo:
namedCertificates:
- certFile: fullchain.pem
  keyFile: privkey.pem
  names:
  - "cr.xfc.io"
EOF
```

```sh
wget https://github.com/mikefarah/yq/releases/download/1.14.0/yq_linux_amd64
chmod + yq_linux_amd64 && mv yq_linux_amd64 /usr/local/bin/yq

cp /var/lib/origin/openshift.local.config/master/master-config.yaml config.yaml
yq merge patch.yaml config.yaml > /var/lib/origin/openshift.local.config/master/master-config.yaml

cp /etc/letsencrypt/live/cr.xfc.io/fullchain.pem var/lib/origin/openshift.local.config/master
cp /etc/letsencrypt/live/cr.xfc.io/privkey.pem /var/lib/origin/openshift.local.config/master

oc cluster up --public-hostname='cr.xfc.io' --routing-suffix='cr.xfc.io' --use-existing-config=true
```
