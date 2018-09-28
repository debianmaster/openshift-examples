>  On registry server dev.run9.io

```sh
mkdir docker-mirror
cd docker-mirror

cat <<EOF >> config.yml
version: 0.1
proxy:
  remoteurl: https://registry-1.docker.io
  username: dockeruser
  password: dockerpass
storage:
  filesystem:
    rootdirectory: /var/lib/registry
    maxthreads: 100
EOF    

mkdir certs
openssl req  -newkey rsa:4096 -nodes -sha256 -keyout certs/domain.key -x509 -days 365 -out certs/domain.crt
docker run -d   --restart=always   --name registry   -v `pwd`/certs:/certs   -v `pwd`/config.yml:/etc/docker/registry/config.yml   -e REGISTRY_HTTP_ADDR=0.0.0.0:5000   -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt   -e REGISTRY_HTTP_TLS_KEY=/certs/domain.key   -p 5000:5000   registry:2
```


> Onclient add insecure registry and restart docker
```sh
cat /etc/sysconfig/docker
...
OPTIONS='--selinux-enabled --log-driver=journald --signature-verification=false --insecure-registry=dev.run9.io:5000'
...
```

> Pull image using mirror
```sh
docker pull dev.run9.io:5000/debianmaster/nodejs-welcome
```
> where debianmaster/nodejs-welcome   is docker.io hub repo  that is mirrored via dev.run9.io:5000/debianmaster/nodejs-welcome
