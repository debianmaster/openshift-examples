```yaml
apiVersion: config.istio.io/v1alpha2
kind: RouteRule
metadata:
  name: stop-recommendations
spec:
  destination:
    name: recommendations
  rules:
  - aspects:
    - kind: quotas
      params:
        quotas:
        - descriptorName: RequestCount
          maxAmount: 0
          expiration: 1s
 ```
 
 
 ```yaml
 apiVersion: config.istio.io/v1alpha2
kind: RouteRule
metadata:
  name: reviews-fault-inject
spec:
  destination:
    name: reviews
  precedence: 5
  httpFault:
    delay:
      fixedDelay: 7s
      percent: 100
```


```yaml

apiVersion: config.istio.io/v1alpha2
kind: RouteRule
metadata:
  name: products-fault-inject
spec:
  destination:
    name: products
  precedence: 5
  route:
  - labels:
      version: v1
  httpFault:
    delay:
      fixedDelay: 7s
      percent: 100
 ```
 
 ```sh
 oc create -f <(istioctl kube-inject --hub $PILOT_HUB --tag $PILOT_TAG -f samples/apps/store/products.deploy.yaml)
oc create -f <(istioctl kube-inject --hub $PILOT_HUB --tag $PILOT_TAG -f samples/apps/store/store.deploy.yaml -n myproject)
```

 
