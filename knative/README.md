> After https://github.com/debianmaster/openshift-examples/tree/master/istio

```sh
curl -L https://storage.googleapis.com/knative-releases/serving/latest/release-lite.yaml   | sed 's/LoadBalancer/NodePort/'   | oc apply -f -
```
