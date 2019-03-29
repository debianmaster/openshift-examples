```sh
kubectl get nodes -o json | jq .items[].spec.taints

```
