```sh
oc adm policy add-scc-to-user anyuid -z default
oc create -f bc.yaml
oc new-app minio-ocp --name=myminio
```
