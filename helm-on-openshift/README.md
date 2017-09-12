### Verify right openshift version
```
sh-3.2$ oc version
oc v3.7.0-alpha.1+fdbd3dc
kubernetes v1.7.0+695f48a16f
features: Basic-Auth
```

### Bring up cluster 
```
oc cluster up
oc project myproject
```

### Install helm cli from 
```
https://github.com/kubernetes/helm/releases
```

### Install helm tiller
```
helm init 
oc get pods -n kube-system
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:kube-system:default
```

### Deploy Redis
```
helm install stable/redis
```




