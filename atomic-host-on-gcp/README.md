#### WIP
```sh
wget http://cloud.centos.org/centos/7/atomic/images/CentOS-Atomic-Host-7-GenericCloud.qcow2.xz
xz --decompress CentOS-Atomic-Host-7-GenericCloud.qcow2.xz
qemu-img convert -S 4096 -f qcow2 -O raw CentOS-Atomic-Host-7-GenericCloud.qcow2 disk.raw
tar -Szcf atomic-host.tar.gz disk.raw
gsutil mb gs://atomoc-host
gsutil cp atomic-host.tar.gz gs://atomoc-host
```
