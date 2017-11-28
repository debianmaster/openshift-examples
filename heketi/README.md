

### Install heketi-cli 

```yum -y install heketi-client```

### On OpenShift I grabbed the following info
### Heketo route
```oc get routes -n glusterfs -o jsonpath='{.items[*].spec.host}{"\n"}'```

### Token
```oc get secret heketi-storage-admin-secret -n glusterfs  -o jsonpath='{.data.key}' | base64 -d```

### Username
The default is `admin`

### Now export these
```
export HEKETI_CLI_SERVER=http://heketi-storage-glusterfs.apps.172.16.1.10.nip.io
export HEKETI_CLI_USER=admin
export HEKETI_CLI_KEY="kiCN5liH2NlENiB3VVZC5xyzfYEkJoRJCW3TZtbDjJY$"
```


### You should be able to administer now
```sh
heketi-cli volume list
Id:4929364e921514486f147380d70d8119    Cluster:ef045a0b9a13c955a717ab4d6b4e1e3b    Name:heketidbstorage
Id:a533436be2ced2b46f2d48238c7b46f3    Cluster:ef045a0b9a13c955a717ab4d6b4e1e3b    Name:glusterfs-registry-volume
Id:a705b4e18c4a0d82f0223f8a994dd0f4    Cluster:ef045a0b9a13c955a717ab4d6b4e1e3b    Name:vol_a705b4e18c4a0d82f0223f8a994dd0f4
I expanded a volume using:

heketi-cli volume expand --volume=a533436be2ced2b46f2d48238c7b46f3 --expand-size=5
The –expand-size is how much you want to ADD to the existing storage. For example; if the volume was 10GB and you passwd –expand-size=5, it'll now be 15GB.
```


### TL;DR
```sh
export HEKETI_CLI_SERVER=http://$(oc get routes -n glusterfs -o jsonpath='{.items[*].spec.host}{"\n"}')
export HEKETI_CLI_USER=admin
export HEKETI_CLI_KEY=$(oc get secret heketi-storage-admin-secret -n glusterfs  -o jsonpath='{.data.key}' | base64 -d)
```
