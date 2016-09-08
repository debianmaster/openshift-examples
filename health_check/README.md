```yml
livenessProbe:
  # an http probe
  httpGet:
    path: /healthz
    port: 8080
    initialDelaySeconds: 15
    timeoutSeconds: 1
```
