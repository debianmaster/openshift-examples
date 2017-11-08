```sh
oc create clusterquota for-amrutha \
--project-annotation-selector openshift.io/requester=amrutha \
--hard requests.cpu=1 \
--hard requests.memory=2 \
--hard limits.cpu=2 \
--hard limits.memory=2.5
```     
