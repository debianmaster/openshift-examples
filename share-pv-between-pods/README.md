### Setup nfs server
```sh
yum install nfs-utils
chkconfig nfs on 
systemctl enable nfs
mkdir /nfsshare && mkdir /nfsshare/pv01 && mkdir /nfsshare/pv02 && mkdir /nfsshare/pv03
systemctl enable rpcbind
systemctl enable nfs-server
systemctl enable nfs-lock
systemctl enable nfs-idmap
systemctl start rpcbind
systemctl start nfs-server
chown -R nfsnobody:nfsnobody /nfsshare
cat <<EOF 
/nfsshare/pv01 *(rw,root_squash)
/nfsshare/pv02 *(rw,root_squash)
/nfsshare/pv03 *(rw,root_squash)
EOF 
> /etc/exports
systemctl restart nfs-server
showmount -e
```



