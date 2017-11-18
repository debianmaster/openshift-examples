I have 1 replica of database with label `app=database`  
```yaml
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: mysqldb
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: database
    spec:
      containers:
      - name: name
        image: debianmaster/nodejs-welcome
 ```

I want `3` replicas of another pod with label `app=webserver` with podAffinity constraint of (`app=database` and `requiredDuringSchedulingIgnoredDuringExecution`)   

```yaml
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: podaffinity-demo
spec:
  affinity:
    podAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
      - labelSelector:
          matchExpressions:
          - key: app
            operator: In
            values:
            - database
        topologyKey: kubernetes.io/hostname
  replicas: 5
  template:
    metadata:
      labels:
        app: webserver
    spec:
      containers:
      - name: name
        image: debianmaster/nodejs-welcome
 ```

I expect all `app=webserver` pods to scheduled on same server where `app=database` pod is residing.

```sh
oc get pods -o wide
```
