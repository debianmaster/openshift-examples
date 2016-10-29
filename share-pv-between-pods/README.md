
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
/nfsshare/pv4 *(rw,root_squash)
/nfsshare/pv5 *(rw,root_squash)
/nfsshare/pv6 *(rw,root_squash)
/nfsshare/pv7 *(rw,root_squash)
/nfsshare/pv8 *(rw,root_squash)
/nfsshare/pv9 *(rw,root_squash)
/nfsshare/pv10 *(rw,root_squash)
/nfsshare/pv11 *(rw,root_squash)
/nfsshare/pv12 *(rw,root_squash)
/nfsshare/pv13 *(rw,root_squash)
/nfsshare/pv14 *(rw,root_squash)
/nfsshare/pv15 *(rw,root_squash)
/nfsshare/pv16 *(rw,root_squash)
/nfsshare/pv17 *(rw,root_squash)
/nfsshare/pv18 *(rw,root_squash)
/nfsshare/pv19 *(rw,root_squash)
/nfsshare/pv20 *(rw,root_squash)
/nfsshare/pv21 *(rw,root_squash)
/nfsshare/pv22 *(rw,root_squash)
/nfsshare/pv23 *(rw,root_squash)
/nfsshare/pv24 *(rw,root_squash)
/nfsshare/pv25 *(rw,root_squash)
/nfsshare/pv26 *(rw,root_squash)
/nfsshare/pv27 *(rw,root_squash)
/nfsshare/pv28 *(rw,root_squash)
/nfsshare/pv29 *(rw,root_squash)
/nfsshare/pv30 *(rw,root_squash)
/nfsshare/pv31 *(rw,root_squash)
/nfsshare/pv32 *(rw,root_squash)
/nfsshare/pv33 *(rw,root_squash)
/nfsshare/pv34 *(rw,root_squash)
/nfsshare/pv35 *(rw,root_squash)
/nfsshare/pv36 *(rw,root_squash)
/nfsshare/pv37 *(rw,root_squash)
/nfsshare/pv38 *(rw,root_squash)
/nfsshare/pv39 *(rw,root_squash)
/nfsshare/pv40 *(rw,root_squash)
/nfsshare/pv41 *(rw,root_squash)
/nfsshare/pv42 *(rw,root_squash)
/nfsshare/pv43 *(rw,root_squash)
/nfsshare/pv44 *(rw,root_squash)
/nfsshare/pv45 *(rw,root_squash)
/nfsshare/pv46 *(rw,root_squash)
/nfsshare/pv47 *(rw,root_squash)
/nfsshare/pv48 *(rw,root_squash)
/nfsshare/pv49 *(rw,root_squash)
/nfsshare/pv50 *(rw,root_squash)
EOF

setsebool -P virt_sandbox_use_nfs 1 #on all nodes
setsebool -P virt_use_nfs 1  #on all nodes
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
for k in {4..50}; do mkdir -p /nfsshare/pv$k; done
systemctl restart nfs-server
for k in {4..50}; do echo  '/nfsshare/pv'${k}' *(rw,root_squash)'; done
```
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
   server: "35.161.240.37"
 persistentVolumeReclaimPolicy: "Recycle"
EOF
oc create -f pv.yaml
done
```
