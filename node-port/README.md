```yml
apiVersion: v1
kind: Service
metadata:
  labels:
    template: mongodb-ephemeral-template
  name: mongodb
spec:
  clusterIP: 172.30.151.152
  portalIP: 172.30.151.152
  ports:
  - nodePort: 30080  ##added this
    port: 27017
    protocol: TCP
    targetPort: 27017
  selector:
    name: mongodb
  sessionAffinity: None
  type: NodePort  ##changed this
status:
  loadBalancer: {}
```
