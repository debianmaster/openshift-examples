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
