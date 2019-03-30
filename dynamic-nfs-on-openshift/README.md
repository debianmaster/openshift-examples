

> dynamic prov

```sh
oc new-project nfs
mkdir -p /srv  #on target server
git clone https://github.com/kubernetes-incubator/external-storage.git
cd external-storage/nfs
kubectl create -f deploy/kubernetes/deployment.yaml
kubectl create -f deploy/kubernetes/class.yaml
oc adm policy add-scc-to-user privileged -z nfs-provisioner -n nfs
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:nfs:nfs-provisioner

oc patch storageclass example-nfs -p '{"metadata":{"annotations":{"storageclass.beta.kubernetes.io/is-default-class":"true"}}}'
```


```sh
oc annotate ns nfs openshift.io/node-selector="nfs=blr"
```


> Should have a existing nfs

```sh
mkdir -p /exports/nfs
chown -R nfsnobody:nfsnobody /exports/nfs
chmod 777 -R /exports/nfs
```
