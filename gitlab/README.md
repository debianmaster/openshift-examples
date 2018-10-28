```sh
$ oc new-project git
$ helm init
$ oc adm policy add-scc-to-user privileged -z gitlab-gitlab-runner
$ helm repo add gitlab https://charts.gitlab.io/
$ helm repo update
$ helm install \
        --set gitlabUrl=http://gitlab.your-domain.com,runnerRegistrationToken=your-registration-token \
        gitlab/gitlab-runner
```



```sh
https://gitlab.com/yourorg/yourrepo/settings/ci_cd
```
