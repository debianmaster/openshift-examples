
### Install packages 
```sh
oc get nodes --show-labels
ansible nodes -m "shell" -a "sudo fdisk -l | grep 'Disk /dev/s'"
ansible nodes -m "shell" -a "sudo yum install -y glusterfs-fuse -y"
```

### Modify inventory file
```yaml
[OSEv3:children]
glusterfs

[OSEv3:vars]
openshift_storage_glusterfs_namespace=glusterfs
openshift_storage_glusterfs_name=storage
openshift_storage_glusterfs_wipe=True

[glusterfs]
ocp-node-0  glusterfs_devices='[ "/dev/sdd"]'
ocp-node-1  glusterfs_devices='[ "/dev/sdd"]'
ocp-node-2  glusterfs_devices='[ "/dev/sdd"]'
```
>  /dev/sdd may change for your environment.

### Redeploy openshift
```sh
ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/byo/config.yml
```

### Gotchas:-
> If you like to use infra or master vm make sure you have right labels on them, For Ex:-  make sure you have label `type=app` on the nodes where you want to install gluster
```sh
ocp-node-0 openshift_node_labels="{'type': 'app', 'zone': 'default'}" openshift_hostname=ocp-node-0
```      
> To list cluster id inside heketi pod
```sh
heketi-cli cluster list  --user=admin -s http://localhost:8080  --secret=$HEKETI_ADMIN_KEY
```
