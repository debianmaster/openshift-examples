```sh
wget https://raw.githubusercontent.com/Maistra/openshift-ansible/maistra-0.3/istio/istio_community_operator_template.yaml
oc process -f istio_community_operator_template.yaml -p OPENSHIFT_ISTIO_MASTER_PUBLIC_URL=https://master.singa.openshiftworkshop.com -p OPENSHIFT_ISTIO_VERSION=1.0.3 | oc apply -f-
```
