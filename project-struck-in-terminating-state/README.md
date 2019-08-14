> check left over services

```sh
for ns in `kubectl get ns --field-selector status.phase=Terminating -o name | cut -d/ -f2`; 
do
  echo "apiservice under namespace $ns"
  kubectl get apiservice -o json |jq --arg ns "$ns" '.items[] |select(.spec.service.namespace != null) | select(.spec.service.namespace == $ns) | .metadata.name ' --raw-output
  echo "api resources under namespace $ns"
  for resource in `kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get -o name -n $ns`; 
  do 
    echo $resource
  done;
done
```


```sh
kubectl proxy --port=8080 &
export NS=biqmind
kubectl create ns $NS --dry-run -ojson > /tmp/ns.json
curl -k -H "Content-Type: application/json" -X PUT --data-binary @/tmp/ns.json http://localhost:8080/api/v1/namespaces/$NS/finalize
```

```sh
> not working
kubectl -n rook-ceph patch ns rook-ceph -p '{"metadata":{"finalizers": []}}' --type=merge
```

```sh
oc api-resources --verbs=list --namespaced -o name | xargs -n 1 oc get --show-kind --ignore-not-found -n <Project-Name>

export TOKEN=$(oc whoami -t)
export PROJECT=kubevirt
oc export ns $PROJECT -o yaml > tmp.json
curl -k -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" -X PUT --data-binary @tmp.json https://kubernetes-cluster-ip/api/v1/namespaces/$PROJECT/finalize
```


```sh

There is a work around for this

1. `kubectl get ns <namespace> -o json > namespace.json`
2. remove the `- kubernetes` in the temp.json
3. `kubectl proxy`
4. http://127.0.0.1:8001/api/v1/namespaces//finalize

then delete the namespace .
````

credits:  https://github.com/Azure/AKS/issues/733#issuecomment-442919644


>  cleanup.sh <targetns>
  
```sh
kubectl get namespace $1 -o json | jq .spec.finalizers=[] > tmp.json
export TOKEN=$(oc whoami -t)
echo $TOKEN
curl -k -H "Content-Type: application/json" -H "Authorization: Bearer $TOKEN" -X PUT --data-binary @tmp.json https://cloud.run9.io/api/v1/namespaces/$1/finalize
```
