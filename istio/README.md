
## Run as cluster administrator

>  http://www.maistra.io/istiodocs/install/

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
  istio:
    authentication: true
    community: true
    version: 0.2.0
  jaeger:
    version: 1.7.0
    elasticsearch_memory: 1Gi
  kiali:
    version: 0.8.0
    username: username
    password: password
 ```
