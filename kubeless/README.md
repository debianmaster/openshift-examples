
```sh
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:kubeless:default
#Install kubeless from https://github.com/bitnami/kubeless/releases 
kubeless install
oc adm policy add-scc-to-user anyuid -z default -n kubeless
```
