## Allow anyuid
```sh
oc adm policy add-scc-to-user anyuid -z default
```

## Deploy statefulset
```sh
kubectl apply -f https://raw.githubusercontent.com/cockroachdb/cockroach/master/cloud/kubernetes/cockroachdb-statefulset.yaml
```

## Scale statefulset
```sh
kubectl scale statefulset cockroachdb --replicas=4
```

###
```sh
kubectl run cockroachdb -it --image=cockroachdb/cockroach --rm --restart=Never     -- sql --insecure --host=cockroachdb-public
```
