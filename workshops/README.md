## Dev workshop
```sh
oc new-app samueltauil/workshopper -e CONTENT_URL_PREFIX=https://raw.githubusercontent.com/k8s-hyd/openshiftv3-workshop/master   -e WORKSHOPS_URLS=https://raw.githubusercontent.com/k8s-hyd/openshiftv3-workshop/master/_module_groups.yml  --name=lab
```
