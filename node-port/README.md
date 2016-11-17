```sh
```


```yml
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  labels:
    docker-registry: default
  name: docker-registry4
spec:
  ports:
  - name: 5000-tcp
    port: 5000
    protocol: TCP
    targetPort: 5000
    nodePort: 30000
  selector:
    docker-registry: default
  sessionAffinity: None
  type: NodePort
status:
  loadBalancer: {}
```
