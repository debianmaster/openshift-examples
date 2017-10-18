

### Step 0:  Create Azure file     
> Storage Accounts -> select storage account -> Select files Block ->  New File share -> Provide name and Quota
Let's say you created share-1

### Step 1:  Install packages all nodes
```sh
# Install samba-client, samba-common, and cifs-utils on all nodes:
$ sudo yum install samba-client samba-common cifs-utils
Enable SELinux booleans on all nodes:
$ /usr/sbin/setsebool -P virt_use_samba on
$ /usr/sbin/setsebool -P virt_sandbox_use_samba on
```

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
 Azure file
 https://docs.microsoft.com/en-us/azure/storage/files/storage-how-to-create-file-share#Create file share through the Portal  
 
 Azure Storage account keys
 https://stackoverflow.com/questions/6985921/where-can-i-find-my-azure-account-name-and-account-key
 
 Note that key is already base64 encoded, so you need to furhter base64 encode it when creating secret via yaml file
