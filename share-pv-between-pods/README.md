### Creating persistant volumes & persistant volume claims
```sh
oc create -f pv.yml
oc create -f pvc.yml
```

### Use PVC inside pods
> Im using same pvc "claim1"  in both pods

```sh
oc create -f pv-pod1.yml
oc create -f pv-pod2.yml
```

> If i ssh into one pod and change contents of /var/www/html, it should effect other pod  /var/www/html







### Setup nfs server
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



