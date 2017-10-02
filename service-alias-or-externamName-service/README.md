> There may be a situation where you need to refer a service running in different namesapce or externally (outside cluster) without using the service FQDN    
> K8s externalName service is pretty useful in this case.

In this example you have a service running under `fulfilment` namesapce (fflmnt) but needs to be referred from `store ` namespace.
But with out using full FQDN,  this can be achieved as follows

service-alias.yaml

```yaml
kind: Service
apiVersion: v1
metadata:
  name: inventory
spec:
  type: ExternalName
  externalName: inventory.fflmnt.svc.cluster.local
```
```
oc apply -f service-alias.yaml -n store
```
> Now when you refer `inventory`  in store namespace request will be sent to `inventory.fflmnt.svc.cluster.local`  or any external service you wish
