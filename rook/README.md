
**Rook** is an open source file, block and object storage for your cloud native environment and is based on battle tested ceph storage.  Rook offers storage for your Openshift apps through persistent volumes which can be dynamically provisioned with kubernetes StorageClass.

The installation it self is fairly simple and can be drilled down to two high level steps
```sh
oc create -f rook-operator.yaml
oc create -f rook-cluster.yaml

```
### Detailed installation steps
#### Clone repo 
```sh
$ git clone https://github.com/rook/rook.git
$ cd rook/demo/kubernetes/1.5
$ oc new-project rook
```

#### Permissions to rook operator as cluster-admin
```sh
$ oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:rook:default
$ oc adm policy add-scc-to-user anyuid -z default -n rook
$ oc adm policy add-scc-to-user privileged -z default -n rook
```
#### Create rook operator
```sh
$ oc create -f rook-operator.yaml
$ sleep 10 ##wait for rook operator to be created
$ cat rook-cluster.yaml #for more options
$ oc create -f rook-cluster.yaml
$ oc get pods -n rook ## wait for rook cluster to be created.
$ oc create -f rook-storageclass.yaml
```
#### How to use?
You can use rook in the same way like you use an other openshift storage class.
Ex:- `oc create -f mysql.yaml -n default`. #inside demo/1.5/kubernetes folder. Note:- when provisioning storage rook uses a secret called rook-rook-user copy this secret to different namespace if you want to provision storage on a different namespace other than default

Want to know more?
1) https://rook.io/
2) https://github.com/rook/rook
