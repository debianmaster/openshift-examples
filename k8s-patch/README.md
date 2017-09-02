```sh
kubectl patch deployment welcome --type='json' \
-p='[{"op": "add","path": "/spec/template/spec/containers/0","value":{"livenessProbe":{"httpGet":{"path":"/healthz","port":"liveness-port"}}}}]'
```
