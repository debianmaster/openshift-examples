```sh
git clone https://github.com/rook/rook ~/rook
cd ~/rook/cluster/examples/kubernetes/ceph
git checkout v0.9.3
oc apply -f scc.yaml
vi cluster.yaml   ->  dataDirHostPath: /apps1/rook

oc adm policy add-scc-to-user rook-ceph -z default -n rook-ceph
oc adm policy add-scc-to-user -z rook-ceph-osd privileged -n rook-ceph
oc adm policy add-scc-to-user -z rook-ceph-mgr privileged -n rook-ceph
oc adm policy add-scc-to-user -z default privileged -n rook-ceph

oc apply -f operator.yaml
oc project rook-ceph-system
oc set env deploy/rook-ceph-operator ROOK_HOSTPATH_REQUIRES_PRIVILEGED=true
oc apply -f cluster.yaml
oc create -f storageclass.yaml
oc create route passthrough rook --service=rook-ceph-mgr-dashboard --hostname=rook.run9.io

oc patch storageclass rook-ceph-block -p '{"metadata":{"annotations":{"storageclass.beta.kubernetes.io/is-default-class":"true"}}}'
oc apply -f pool.yaml
```


> cleanup
```
cd ~/rook/cluster/examples/kubernetes/ceph
oc delete -f cluster.yaml
oc delete -f operator.yaml
ansible-playbook rook-cleanup.yaml
```

```sh
cat cluster.yaml | grep hostNetwork
    hostNetwork: false
```    

> not working
```sh
oc create route reencrypt rook-ceph-mgr-dashboard --service=rook-ceph-mgr-dashboard --hostname=rook.example..io -n rook-ceph --ca-cert='/etc/cloud.example..io/certs/wildcard.example..io/*.example..io/*.example..io.cer' --cert='/etc/cloud.example..io/certs/wildcard.example..io/*.example..io/fullchain.cer' --key='/etc/cloud.example..io/certs/wildcard.example..io/*.example..io/*.example..io.key'
```


