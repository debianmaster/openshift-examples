## install rook block and object storage
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
oc adm policy add-scc-to-user anyuid -z default -n rook-ceph
```

## expose s3 url
```sh
#8080 port change from 80
oc expose svc rook-ceph-rgw-my-store --hostname=obj.example.io --name=t1
```


## registry storage
```
brew install minio/stable/mc
mc config host add rook-obj http://s3.example.io/ XHYABB12311111F05UQ2 p6YGeOyIiuasdflkajdfkaLrkkoqBuJi62BbM80
mc mb  rook-obj/registry
```

## use rook object storage for registry
```yaml
openshift_hosted_registry_storage_kind=object
openshift_hosted_registry_routehost=registry.example.io
openshift_hosted_registry_storage_provider=s3
openshift_hosted_registry_storage_s3_encrypt=false
openshift_hosted_registry_storage_s3_accesskey=XHYABB12311111F05UQ2
openshift_hosted_registry_storage_s3_secretkey=p6YGeOyIiuasdflkajdfkaLrkkoqBuJi62BbM80
openshift_hosted_registry_pullthrough=true
openshift_hosted_registry_acceptschema2=false
openshift_hosted_registry_enforcequota=true
openshift_hosted_registry_storage_s3_region=registry
openshift_hosted_registry_storage_s3_regionendpoint=http://s3.example.io/
openshift_hosted_registry_storage_s3_bucket=registry
openshift_hosted_registry_storage_s3_rootdirectory=/registry
```

## re-install registry
```sh
oc delete dc,route,svc docker-registry
ansible-playbook playbooks/openshift-hosted/deploy_registry.yml
```


https://rook.io/docs/rook/master/openshift.html
