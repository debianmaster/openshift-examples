```sh
oc new-project gitlab
oc adm policy add-scc-to-user anyuid -z gitlab-ce-user -n gitlab
oc adm policy add-scc-to-user privileged -z gitlab-runner-user -n gitlab
```

# Setup gitlab template (optional)
```sh
# gitlab openshift template
oc apply -f https://gitlab.com/gitlab-org/omnibus-gitlab/raw/master/docker/openshift-template.json
```

# Setup gitlab runner
```
# no docker access
oc apply -f https://gitlab.com/gitlab-org/omnibus-gitlab/raw/f04b5c4443b3a98011577cdd7c9de766a287531e/docker/openshift/runner-template.yml

# Dind option

# Docker socket option
https://raw.githubusercontent.com/debianmaster/openshift-examples/master/gitlab-ci-with-openshift/gitlab-runner.yaml
```
