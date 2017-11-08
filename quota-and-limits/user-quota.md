```sh
oc create clusterquota for-user \
     --project-annotation-selector openshift.io/requester=chakra \
     --hard pods=10 \
     --hard secrets=20
```     
