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
`versionTag: master-latest` to `versionTag: v0.3.1-105-ga19b5f6`

> Change following in rook-operator.yaml   
`image: quay.io/rook/rookd:master-latest` to `image: quay.io/rook/rookd:v0.3.1-105-ga19b5f6`

```sh
oc create -f demo/kubernetes/rook-operator.yaml
sleep 10 #let operator pod get created.
oc create -f demo/kubernetes/rook-cluster.yaml
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:rook:rook-api
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:default:rook-operator
rook filesystem create --name testFS
```


> Other steps  

```sh
oc edit scc restricted #as cluster-admin
#add following to volumes section at the botton
- cephFS
```

> Cleanup
```sh
oc delete -f rook-operator.yaml
oc delete -n rook cluster rook
oc delete -n rook serviceaccount rook-api
oc delete clusterrole rook-api
oc delete clusterrolebinding rook-api
oc delete thirdpartyresources cluster.rook.io pool.rook.io
oc delete secret rook-rook-user
oc delete namespace rook
oc delete -n default serviceaccount rook-operator
```
