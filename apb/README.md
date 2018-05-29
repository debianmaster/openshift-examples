```sh
registry:
  - type: local_openshift
    name: localregistry
    namespaces: ['openshift']
    white_list: [.*-apb$]
  - type: dockerhub
    name: dh
    url:  https://registry.hub.docker.com
    org:  debianmaster
    tag:  latest
    white_list: [.*-apb$]
```


```sh
alias apb='docker run --rm --privileged -v $PWD:/mnt -v /var/run/docker.sock:/var/run/docker.sock -v $HOME/.kube:/.kube -e DOCKER_TLS_VERIFY="1" -u $UID docker.io/ansibleplaybookbundle/apb-tools  "$@"'
```
