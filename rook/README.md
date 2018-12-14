```sh
git clone https://github.com/rook/rook.git
cd rook/cluster/examples/kubernetes/ceph
kubectl create -f operator.yaml
kubectl create -f cluster.yaml
oc apply -f scc.yaml
vi cluster.yaml
oc apply -f cluster.yaml
oc apply -f object.yaml
oc create -f storageclass.yaml
oc adm policy add-scc-to-user rook-ceph -z default -n rook-ceph
oc create -f object-user.yaml
oc patch storageclass rook-ceph-block -p '{"metadata":{"annotations":{"storageclass.beta.kubernetes.io/is-default-class":"true"}}}'
oc -n rook-ceph describe secret rook-ceph-object-user-my-store-my-user
kubectl -n rook-ceph get secret rook-ceph-object-user-my-store-my-user -o yaml | grep AccessKey | awk '{print $2}' | base64 --decode
kubectl -n rook-ceph get secret rook-ceph-object-user-my-store-my-user -o yaml | grep SecretKey | awk '{print $2}' | base64 --decode
```
