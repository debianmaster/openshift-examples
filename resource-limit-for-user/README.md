```sh
oc create clusterquota for-user \
     --project-annotation-selector openshift.io/requester=<user-name> \
     --hard pods=10 \
     --hard secrets=20 \
     --hard limits.memory=2Gi \
     --hard limits.storage=1Gi
```     
