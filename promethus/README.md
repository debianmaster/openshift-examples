### Deploy Prometheus
```sh
oc project openshift-infra
oc adm policy add-cluster-role-to-user cluster-reader system:serviceaccount:openshift-infra:default
oc create -f https://raw.githubusercontent.com/coreos/blog-examples/master/monitoring-kubernetes-with-prometheus/prometheus.yml
```
### Proxy UI to localhost
`kubectl get pods -l app=prometheus -o name | sed 's/^.*\///' | xargs -I{} kubectl port-forward {} 9090:9090`
 Open localhost:9090   




