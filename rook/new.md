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
```


> cleanup
```
/var/lib/rook/mon-a/data/keyring.
```

