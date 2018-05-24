> Should have a existing nfs

```sh
mkdir -p /exports/nfs
chown -R nfsnobody:nfsnobody /exports/nfs
chmod 777 -R /exports/nfs
```

```sh
git clone https://github.com/kubernetes-incubator/external-storage
cd external-storage/docs/demo/
oc new-project nfs-storge
oc adm policy add-scc-to-user privileged -z default
oc adm policy add-cluster-role-to-user cluster-admin -z default
oc apply -f .
oc patch storageclass example-nfs -p '{"metadata":{"annotations":{"storageclass.beta.kubernetes.io/is-default-class":"true"}}}'
```
