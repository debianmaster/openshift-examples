```sh
$ helm repo add gitlab https://charts.gitlab.io/
$ helm repo update
$ helm install \
        --set gitlabUrl=http://gitlab.your-domain.com,runnerRegistrationToken=your-registration-token \
        gitlab/gitlab-runner
```
