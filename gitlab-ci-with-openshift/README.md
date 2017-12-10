```sh
oc adm policy add-scc-to-user anyuid -z gitlab-ce-user
oc adm policy add-scc-to-user privileged -z gitlab-runner-user

oc project gitlab
oc apply -f https://gitlab.com/gitlab-org/omnibus-gitlab/raw/master/docker/openshift-template.json


oc apply -f https://gitlab.com/gitlab-org/omnibus-gitlab/raw/f04b5c4443b3a98011577cdd7c9de766a287531e/docker/openshift/runner-template.yml
```
