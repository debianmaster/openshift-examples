

### Step 1:  Create Azure file     
> Storage Accounts -> select storage account -> Select files Block ->  New File share -> Provide name and Quota
Let's say you created share-1

### Step 2:  Create Azure storage secret
> 
```yml
apiVersion: v1
data:
  azurestorageaccountkey: >-
    base64encoded_storageaccount_key
  azurestorageaccountname: base64encoded_username
kind: Secret
metadata:
  name: azure-secret
type: Opaque
```


### Step 2:  Create Azure PV
> Make sure you match the sharename/Size with the one you created in AzureFile

```yml
apiVersion: "v1"
kind: "PersistentVolume"
metadata:
  name: "pv0001" 
spec:
  capacity:
    storage: "5Gi" 
  accessModes:
    - "ReadWriteMany"
  azureFile: 
    secretName: azure-secret 
    shareName: share-1 
    readOnly: false 
 ```
 
 ### Notes:
 
