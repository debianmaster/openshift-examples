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
kubectl run --image=debianmaster/store-fe store  \
--env=inventory_svc=http://inventory:8000 \
--env=products_svc=http://products:8080


kubectl expose deployment store --port=8080


kubectl run --image=centos/mongodb-32-centos7 productsdb \
  --env MONGODB_ADMIN_PASSWORD=password  \
  --env MONGODB_USER=app_user \
  --env MONGODB_DATABASE=store  \
  --env MONGODB_PASSWORD=password

kubectl expose deployment productsdb --port=27017


kubectl run --image=debianmaster/store-products products \
--env=mongo_url='mongodb://app_user:password@productsdb/store'

kubectl expose deployment products --port=8080

kubectl run --image=debianmaster/store-recommendations recommendations
kubectl expose deployment recommendations --port=8080
```

 ```yaml
 apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: productpage1-ingress
  annotations:
    kubernetes.io/ingress.class: istio
spec:
  rules:
  - host: productpage.istio-ingress.myproject.svc.cluster.local
    http:
      paths:
      - backend:
          serviceName: productpage
          servicePort: 8090
```
