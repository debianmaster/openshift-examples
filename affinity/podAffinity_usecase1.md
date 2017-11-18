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
  name: webserver
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
> Not working for some reason

```sh
$ oc get pods -o wide
NAME                         READY     STATUS    RESTARTS   AGE       IP            NODE
mysqldb-1864802640-1zfjg     1/1       Running   0          36m       10.130.0.67   node1.example.com
webserver-2351669744-5gqtd   1/1       Running   0          48s       10.131.0.51   node2.example.com
webserver-2351669744-9f34g   1/1       Running   0          48s       10.130.0.72   node1.example.com
webserver-2351669744-j4z7x   1/1       Running   0          48s       10.130.0.73   node1.example.com
webserver-2351669744-lzvx4   1/1       Running   0          48s       10.128.2.50   node3.example.com
webserver-2351669744-n7f12   1/1       Running   0          48s       10.128.2.51   node3.example.com

```
