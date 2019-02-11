```sh
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
