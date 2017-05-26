### Exposing registry
```sh
oc login -u system:admin
oc expose svc docker-registry -n default
oc  patch route/docker-registry -p '{"spec":{"tls": {"termination":"edge"}}}' -n default
```


### Using registry
> Add your registry hostname (docker-registry-default.10.234.28.181.xip.io) to docker daemon insecure registries if you are using self signed certs 
```sh
oc login  #use non system:admin user
docker login https://docker-registry-default.10.234.28.181.xip.io -u dev -p $(oc whoami -t)
```

