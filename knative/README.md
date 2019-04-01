> After https://github.com/debianmaster/openshift-examples/tree/master/istio


> https://github.com/knative/docs/blob/master/install/Knative-with-OpenShift.md

```sh

oc adm policy add-scc-to-user anyuid -z build-controller -n knative-build
oc adm policy add-scc-to-user anyuid -z controller -n knative-serving
oc adm policy add-scc-to-user anyuid -z autoscaler -n knative-serving
oc adm policy add-scc-to-user anyuid -z kube-state-metrics -n knative-monitoring
oc adm policy add-scc-to-user anyuid -z node-exporter -n knative-monitoring
oc adm policy add-scc-to-user anyuid -z prometheus-system -n knative-monitoring
oc adm policy add-cluster-role-to-user cluster-admin -z build-controller -n knative-build
oc adm policy add-cluster-role-to-user cluster-admin -z controller -n knative-serving

curl -L https://github.com/knative/serving/releases/download/v0.2.3/release-lite.yaml | sed 's/LoadBalancer/NodePort/' | oc apply -f -
```

> Deploy sample application

```
oc new-project knative-test
oc patch scc/privileged --patch {\"allowedCapabilities\":[\"NET_ADMIN\"]}
oc adm policy add-scc-to-user privileged -z default

knctl domain create --domain apps.kndemo-0280.openshiftworkshop.com --default
or
kubectl edit cm config-domain --namespace knative-serving
kubectl edit ksvc helloworld-go
```

> serving.yml

```yaml
apiVersion: serving.knative.dev/v1alpha1 # Current version of Knative
kind: Service
metadata:
  name: helloworld-go # The name of the app
spec:
  runLatest:
    configuration:
      revisionTemplate:
        spec:
          container:
            image: gcr.io/knative-samples/helloworld-go # The URL to the image of the app
            env:
            - name: TARGET # The environment variable printed out by the sample app
              value: "Go Sample v1"
```

```
oc delete limits --all -n knative-test  #temp fix
oc apply -f serving.yml
```

```sh
oc set env dc/router ROUTER_ALLOW_WILDCARD_ROUTES=true -n default
```

```yml
apiVersion: route.openshift.io/v1
kind: Route
metadata:
  name: wildcard-route
  namespace: istio-system
spec:
  host: wildcard.knative-test.apps.sing2-6f37.openshiftworkshop.com
  port:
    targetPort: 80  
  to:
    kind: Service
    name: knative-ingressgateway
    weight: 100
  wildcardPolicy: Subdomain
```  

## Delete everything

```sh
curl -L https://storage.googleapis.com/knative-releases/serving/latest/release-lite.yaml   | sed 's/LoadBalancer/NodePort/'   | oc delete -f -
oc delete project knative-test --grace-period=0 --force
```
