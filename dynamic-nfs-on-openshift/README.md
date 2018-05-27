> Should have a existing nfs

```sh
mkdir -p /exports/nfs
chown -R nfsnobody:nfsnobody /exports/nfs
chmod 777 -R /exports/nfs
```

```sh
git clone https://github.com/kubernetes-incubator/external-storage.git
cd external-storage/nfs
kubectl create -f deploy/kubernetes/deployment.yaml
kubectl create -f deploy/kubernetes/class.yaml
oc patch storageclass example-nfs -p '{"metadata":{"annotations":{"storageclass.beta.kubernetes.io/is-default-class":"true"}}}'
```

