### WIP

```sh
git clone https://github.com/rook/rook.git
cd rook
git checkout  0554a83e3a3a0b3e176793d4ba4b7d14be97525d  #before kube1.6
oc new-project rook
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:rook:default
oc adm policy add-scc-to-user anyuid -z default -n rook
oc adm policy add-scc-to-user privileged -z default -n rook
oc create -f demo/kubernetes/rook-operator.yaml
oc create -f demo/kubernetes/rook-cluster.yaml
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:rook:rook-api
```
