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
apiVersion: apps/v1beta1 # for versions before 1.6.0 use extensions/v1beta1
kind: Deployment
metadata:
  name: webserver
spec:
  replicas: 5
  template:
    metadata:
      labels:
        app: webserver
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
            topologyKey: "kubernetes.io/hostname"
      containers:
      - name: webserver
        image: debianmaster/nodejs-welcome
 ```

I expect all `app=webserver` pods to scheduled on same server where `app=database` pod is residing.
> Not working for some reason

```sh
$ oc get pods -o wide
NAME                                       READY     STATUS    RESTARTS   AGE       IP           NODE
mottled-ladybug-jenkins-1837934504-hw5x3   1/1       Running   0          17m       10.28.3.20   gke-book-default-pool-86d13cb0-9bz5
mysqldb-3285196599-92vnk                   1/1       Running   0          1h        10.28.4.3    gke-book-default-pool-86d13cb0-22vv
webserver-4127249034-46kg2                 1/1       Running   0          17s       10.28.4.11   gke-book-default-pool-86d13cb0-22vv
webserver-4127249034-dvfzq                 1/1       Running   0          17s       10.28.4.14   gke-book-default-pool-86d13cb0-22vv
webserver-4127249034-hh33v                 1/1       Running   0          17s       10.28.4.12   gke-book-default-pool-86d13cb0-22vv
webserver-4127249034-nsjvp                 1/1       Running   0          17s       10.28.4.10   gke-book-default-pool-86d13cb0-22vv
webserver-4127249034-qh9j2                 1/1       Running   0          17s       10.28.4.13   gke-book-default-pool-86d13cb0-22vv
```
