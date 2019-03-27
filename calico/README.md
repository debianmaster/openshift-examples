### Install
```sh
kubectl apply -f https://docs.projectcalico.org/v3.6/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml
oc set env ds calico-node IP_AUTODETECTION_METHOD=interface=eth0
oc adm policy add-scc-to-user privileged -z calico-node
oc adm policy add-scc-to-user privileged -z calico-upgrade-job
oc adm policy add-scc-to-user privileged -z calico-kube-controllers
ansible all -a "sysctl -w net.ipv4.conf.all.rp_filter=0"
```

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

### calicoctl
```
export DATASTORE_TYPE=kubernetes
export KUBECONFIG=~/.kube/config
calicoctl get workloadendpoints
```
