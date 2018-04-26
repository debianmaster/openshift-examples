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

#### Webconsole
```
ansible-playbook  \
    /usr/share/ansible/openshift-ansible/playbooks/openshift-web-console/config.yml
```


### Optional
```sh
oc new-project ocp-ops-view
oc create sa kube-ops-view
oc adm policy add-scc-to-user anyuid -z kube-ops-view
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:ocp-ops-view:kube-ops-view
oc apply -f https://raw.githubusercontent.com/raffaelespazzoli/kube-ops-view/ocp/deploy-openshift/kube-ops-view.yaml
oc expose svc kube-ops-view
oc get route | grep kube-ops-view | awk '{print $2}'
```
