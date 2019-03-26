### Debugging
```sh
docker exec -it <caliconode> sh
cat /etc/os-release
apk add curl
curl -O -L  https://github.com/projectcalico/calicoctl/releases/download/v3.5.1/calicoctl
./calicoctl get nodes
```

### force calico to use different network interface

```sh
oc set env ds calico-node --list | grep IP_AUTODETECTION_METHOD
```
