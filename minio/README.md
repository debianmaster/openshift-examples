Server:   

```sh
oc adm policy add-scc-to-user anyuid -z default
oc create -f bc.yaml
oc new-app minio-ocp 
```

Client:
```sh
# create a bucket called my-bucketname , update   accesskey and secret   
oc new-app https://github.com/debianmaster/openshift-examples --context-dir=/minio --name=ex-app
 ````

