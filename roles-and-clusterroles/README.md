### Role
```sh
oc create role test --verb=get,list,watch --resource=pods,pods/status
```


### ClusterRole
```sh
oc create clusterrole "foo" --verb=get --non-resource-url=/logs/*
```

