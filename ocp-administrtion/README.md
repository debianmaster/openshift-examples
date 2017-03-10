```sh
oc login -u system:admin
oc whoami
oc whoami -t 
oc get nodes --show-labels=true
oc adm policy add-cluster-role-to-user cluster-admin <username>
oc label node <nodename> <key>=<value>
oc adm policy add-scc-to-user anyuid -z default -n <namespace>
oc adm policy add-role-to-user admin <username -n <namespace>
```
