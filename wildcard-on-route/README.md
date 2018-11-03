## How to expose a wild card on a openshift route.
> Some times you application may handle wildcard routes Eg:-  nginx / envoy etc, for that you need to allow wildcard requests on a openshift route.

### Allow router to allow wildcards
```
oc env dc/router ROUTER_ALLOW_WILDCARD_ROUTES=true -n default
oc set env dc/router ROUTER_ALLOW_WILDCARD_ROUTES=true -n default  #ocp 3.11
```

### Let openshift know that you want wildcard route
> Key things here are `wildcardPolicy`  and using the keyword `wildcard.<your-openshift-route>`

```yaml
apiVersion: v1
kind: Route
metadata:
  name: mynginx-route
spec:
  host: wildcard.nginx-test.127.0.0.1.nip.io
  to:
    kind: Service
    name: nginx
  wildcardPolicy: Subdomain
```

### What happens?
If 
