### WIP

```sh
git clone https://github.com/rook/rook.git
cd rook
git checkout  0554a83e3a3a0b3e176793d4ba4b7d14be97525d  #before kube1.6
oc new-project rook
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:rook:default
oc adm policy add-scc-to-user anyuid -z default -n rook
oc adm policy add-scc-to-user privileged -z default -n rook
```

> Change following in rook-cluster.yaml    
versionTag: v0.3.1-105-ga19b5f6

> Change following in rook-operator.yaml
image: quay.io/rook/rookd:v0.3.1-105-ga19b5f6

```sh
oc create -f demo/kubernetes/rook-operator.yaml
sleep 10 #let operator pod get created.
oc create -f demo/kubernetes/rook-cluster.yaml
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:rook:rook-api
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:default:rook-operator
rook filesystem create --name testFS
```
