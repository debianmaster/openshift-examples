
## Run as cluster administrator
```
oc new-app -f https://raw.githubusercontent.com/Maistra/openshift-ansible/maistra-0.2.0-ocp-3.1.0-istio-1.0.2/istio/istio_community_operator_template.yaml --param=OPENSHIFT_ISTIO_MASTER_PUBLIC_URL=https://cloud.replaceme.io:8443
```
>  Replace cloud.run9.io  with your own values
