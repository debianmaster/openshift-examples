
> This example deals with creating a persistant volume and sharing the volume with one or more PODs  
> Some points to keep in mind  
> 1) persistant volume (pv) in openshift is using nfs storage in this example   
> 2) volumeName attribute  in  PVC ensures that, pvc always binds to a specific  PV   

### Setup nfs server (Skip if you have already)
```sh
yum install -y nfs-utils

mkdir /nfsshare && mkdir /nfsshare/pv01 && mkdir /nfsshare/pv02 && mkdir /nfsshare/pv03
systemctl enable rpcbind
systemctl enable nfs-server
systemctl enable nfs-lock
systemctl enable nfs-idmap
systemctl start rpcbind
systemctl start nfs-server
chown -R nfsnobody:nfsnobody /nfsshare

cat <<EOF>> /etc/exports
/nfsshare/pv01 *(rw,root_squash)
/nfsshare/pv02 *(rw,root_squash)
/nfsshare/pv03 *(rw,root_squash)
EOF

systemctl restart nfs-server
showmount -e
```

### Creating persistant volumes & persistant volume claims
```sh
oc create -f pv.yml  #update server attribute based on your nfs server
oc create -f pvc.yml
```

### Use PVC inside pods
> Im using same pvc "claim1"  in both pods

```sh
oc create -f pv-pod1.yml
oc create -f pv-pod2.yml
```

> If i ssh into one pod and change contents of /var/www/html, it should effect other pod  /var/www/html


### Ignore notes below

```sh
for k in {4..50}
do
cat <<EOF>> pv.yaml
apiVersion: "v1"
kind: "PersistentVolume"
metadata:
 name: "pv$k"
spec:
 capacity:
   storage: "1Gi"
 accessModes:
   - "ReadWriteMany"
   - "ReadWriteOnce"
 nfs:
   path: "/nfsshare/pv$k"
   server: "35.162.86.236"
 persistentVolumeReclaimPolicy: "Recycle"
EOF
oc create -f pv.yaml
done
```
