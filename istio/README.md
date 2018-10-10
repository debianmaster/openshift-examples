
## Run as cluster administrator

### Install operator
```
oc new-project istio-opreator
oc new-app -f https://raw.githubusercontent.com/Maistra/openshift-ansible/maistra-0.2.0-ocp-3.1.0-istio-1.0.2/istio/istio_community_operator_template.yaml --param=OPENSHIFT_ISTIO_MASTER_PUBLIC_URL=https://cloud.replaceme.io:8443
```
>  Replace cloud.run9.io  with your own values


## Install istio
>   Import yaml/json  and add this to istio-opreator namespace

```yml
apiVersion: "istio.openshift.com/v1alpha1"
kind: "Installation"
metadata:
  name: "istio-installation"
spec:
  deployment_type: openshift
  istio:
    authentication: true
    community: false
    prefix: openshift-istio-tech-preview/
    version: 0.1.0
  jaeger:
    prefix: distributed-tracing-tech-preview/
    version: 1.6.0
    elasticsearch_memory: 1Gi
  launcher:
    openshift:
      user: user
      password: password
    github:
      username: username
      token: token
    catalog:
      filter: filter
      branch: branch
      repo: repo
 ```
