### Not tested
```yaml
apiVersion: "v1"
kind: "PersistentVolume"
metadata:
  name: "pv0001" 
spec:
  capacity:
    storage: "5Gi" 
  accessModes:
    - "ReadWriteOnce"
  azureDisk: 
    diskName: test2.vhd 
    diskURI: https://someacount.blob.core.windows.net/vhds/test2.vhd 
    cachingMode: readwrite  
    fsType: ext4  
    readOnly: false  
```
```yaml
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: slow
provisioner: kubernetes.io/azure-disk
parameters:
  skuName: Standard_LRS
  location: westus2
  storageAccount: cksgag690
  ```
