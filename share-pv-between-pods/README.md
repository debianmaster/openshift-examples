### Setup nfs server
```sh
yum install nfs-utils
chkconfig nfs on 
systemctl enable nfs
mkdir /nfsshare && mkdir /nfsshare/pv01 && mkdir /nfsshare/pv01 && mkdir /nfsshare/pv03
systemctl enable rpcbind
systemctl enable nfs-server
systemctl enable nfs-lock
systemctl enable nfs-idmap
systemctl start rpcbind
systemctl start nfs-server
systemctl start nfs-lock
systemctl start nfs-idmap
chown -R nfsnobody:nfsnobody /nfsshare
cat
/nfsshare/nfs-storge/pv01 *(rw,root_squash)
/nfsshare/nfs-storge/pv02 *(rw,root_squash)
/nfsshare/nfs-storge/pv03 *(rw,root_squash)

