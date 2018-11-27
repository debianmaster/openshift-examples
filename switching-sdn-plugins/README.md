###  WIP.

```sh
ansible all -m replace -a "dest=/etc/origin/node/node-config.yaml regexp='openshift-ovs-subnet' replace='openshift-ovs-multitenant'" -K
ansible masters -m replace -a "dest=/etc/origin/master/master-config.yaml regexp='openshift-ovs-subnet' replace='openshift-ovs-multitenant'" -K
ansible masters -m shell -a "/usr/local/bin/master-restart api" -K
ansible masters -m shell -a "/usr/local/bin/master-restart controllers" -K
oc delete pod --all -n openshift-sdn
ansible all -m shell -a "systemctl restart atomic-openshift-node.service" -K
```
