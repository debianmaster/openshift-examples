```sh
oc create clusterquota for-user \
     --project-annotation-selector openshift.io/requester=<user-name> \
     --hard pods=10 \
     --hard secrets=20 \
     --hard limits.memory=2Gi \
     --hard limits.storage=1Gi \
     --hard requests.storage=10Gi
```     

```yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: core-object-counts
spec:
  hard:
    configmaps: "10"
    requests.storage: "5Gi"
    persistentvolumeclaims: "4" 
    replicationcontrollers: "20" 
    secrets: "10" 
    services: "10" 
    pods: "4" 
    requests.cpu: "1" 
    requests.memory: 1Gi 
    limits.cpu: "2" 
    limits.memory: 2Gi  
  scopes:
  - NotTerminating
```    
