## WIP DO not use

```yaml


```

```yaml
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  name: app-k3s
spec:
  ports:
  - name: "80"
    port: 80
    protocol: TCP
    targetPort: 8000
  selector:
    io.kompose.service: node
  sessionAffinity: None
  type: ClusterIP
status:
  loadBalancer: {}
```

```yaml
apiVersion: v1
items:
- apiVersion: route.openshift.io/v1
  kind: Route
  metadata:
    annotations:
      kubectl.kubernetes.io/last-applied-configuration: |
        {"apiVersion":"route.openshift.io/v1","kind":"Route","metadata":{"annotations":{},"creationTimestamp":null,"name":"app-k3s","namespace":"k3s"},"spec":{"host":"wildcard.k3s.apps.run9.io","port":{"targetPort":"80"},"to":{"kind":"Service","name":"app-k3s","weight":100},"wildcardPolicy":"Subdomain"},"status":{"ingress":[{"conditions":[{"lastTransitionTime":"2019-04-21T16:01:28Z","status":"True","type":"Admitted"}],"host":"wildcard.k3s.apps.run9.io","routerName":"router","wildcardPolicy":"None"}]}}
    creationTimestamp: null
    name: app-k3s
  spec:
    host: wildcard.k3s.apps.run9.io
    port:
      targetPort: "80"
    to:
      kind: Service
      name: app-k3s
      weight: 100
    wildcardPolicy: Subdomain
  status:
    ingress:
    - conditions:
      - lastTransitionTime: 2019-04-21T16:08:10Z
        status: "True"
        type: Admitted
      host: wildcard.k3s.apps.run9.io
      routerName: router
      wildcardPolicy: Subdomain
- apiVersion: route.openshift.io/v1
  kind: Route
  metadata:
    annotations:
      openshift.io/host.generated: "true"
    creationTimestamp: null
    labels:
      io.kompose.service: server
    name: server
  spec:
    host: server-k3s.apps.run9.io
    port:
      targetPort: "6443"
    tls:
      termination: passthrough
    to:
      kind: Service
      name: server
      weight: 100
    wildcardPolicy: None
  status:
    ingress:
    - conditions:
      - lastTransitionTime: 2019-04-21T13:05:14Z
        status: "True"
        type: Admitted
      host: server-k3s.apps.run9.io
      routerName: router
      wildcardPolicy: None
kind: List
metadata: {}
```


```sh
KUBECONFIG=config.yaml kubectl get nodes
KUBECONFIG=config.yaml kubectl -n kube-system patch deploy/traefik --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/ports/0", "value": {"hostPort": 8000,"containerPort":80,protocol:TCP}}]'
```
