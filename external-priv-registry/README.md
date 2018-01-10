https://blog.openshift.com/remotely-push-pull-container-images-openshift/


```sh
oc secrets new-dockercfg <pull_secret_name> \ 

    --docker-server=<registry_server> --docker-username=<user_name> \

    --docker-password=<password> --docker-email=<email> \

oc secrets add serviceaccount/default secrets/<pull_secret_name> --for=pull

oc import-image myimage --from=docker-registry.192.168.121.113.xip.io:80 --confirm --insecure-repository=true
```


```sh
oc new-build qa/hm:promoteToPROD~https://github.com/i63/empty-project --to-docker=true --to='debianmaster/hm:latest' --name=push-to-docker-reg -n prod
```
