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
> Not working for some reason

```sh
oc get pods -o wide
$ oc get pods -o wide
NAME                                READY     STATUS    RESTARTS   AGE       IP            NODE
mysqldb-1864802640-1zfjg            1/1       Running   0          33m       10.130.0.67   node1.example.com
podaffinity-demo-2351669744-0zjxf   1/1       Running   0          30m       10.131.0.49   node2.example.com
podaffinity-demo-2351669744-30509   1/1       Running   0          30m       10.130.0.68   node1.example.com
podaffinity-demo-2351669744-804vr   1/1       Running   0          30m       10.128.2.47   node3.example.com
podaffinity-demo-2351669744-jldk6   1/1       Running   0          30m       10.130.0.69   node1.example.com
podaffinity-demo-2351669744-zlnfx   1/1       Running   0          30m       10.131.0.48   node2.example.com
```
