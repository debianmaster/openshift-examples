```sh
oc project spark
oc adm policy add-scc-to-user anyuid -z default
oc create -f https://raw.githubusercontent.com/debianmaster/openshift-examples/master/spark/template.yml
```
