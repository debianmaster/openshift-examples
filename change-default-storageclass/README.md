
### List Storage classes

```sh
[ocpadmin@mycluster-bastion ~]$ kubectl get storageclass
NAME                          TYPE
generic  (default)   kubernetes.io/azure-disk
glusterfs-storage    kubernetes.io/glusterfs
```

### Lets make Glusterfs default
```
oc edit storageclass glusterfs-storage
```
> Add this annoation and save   
```yaml
metadata:
  annotations:
    storageclass.beta.kubernetes.io/is-default-class: "true"
```

### Verify
```sh
[ocpadmin@mycluster-bastion ~]$ kubectl get storageclass
NAME                          TYPE
generic                       kubernetes.io/azure-disk
glusterfs-storage (default)   kubernetes.io/glusterfs
```
