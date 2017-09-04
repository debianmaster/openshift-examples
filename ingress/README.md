
## Work in progress
####  subdomain based ingress
```sh
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: ingress
spec:
  rules:
  - host: api.mydomain.com
    http:
      paths:
        - backend:
            serviceName: api-service
            servicePort: 80
  - host: console.mydomain.com
    http:
      paths:
        - backend:
            serviceName: console-service
            servicePort: 80
```
