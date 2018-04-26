### work in progress
```sh
ansible all -m shell -a "sudo subscription-manager refresh"

ansible all -m shell -a 'sudo subscription-manager repos --disable="rhel-7-server-ose-3.7-rpms" --enable="rhel-7-server-ose-3.8-rpms" --enable="rhel-7-server-ose-3.9-rpms" --enable="rhel-7-server-extras-rpms" --enable="rhel-7-server-ansible-2.4-rpms" --enable="rhel-7-fast-datapath-rpms"'

ansible all -m shell -a "sudo yum clean all"
```
> inventory file changes
openshift_disable_swap=false


```sh
ansible all -m shell -a "yum update atomic-openshift-utils -y"
```
> upgrade in phases
#### Control plane
```
ansible-playbook  \
    /usr/share/ansible/openshift-ansible/playbooks/byo/openshift-cluster/upgrades/v3_9/upgrade_control_plane.yml  
```

#### worker nodes
```
ansible-playbook  \
    /usr/share/ansible/openshift-ansible/playbooks/byo/openshift-cluster/upgrades/v3_9/upgrade_nodes.yml \
    -e openshift_upgrade_nodes_serial="20%" 
```    
