```sh
wget https://raw.githubusercontent.com/Maistra/openshift-ansible/maistra-0.3/istio/istio_community_operator_template.yaml
oc process -f istio_community_operator_template.yaml -p OPENSHIFT_ISTIO_MASTER_PUBLIC_URL=https://master.singa.openshiftworkshop.com  | oc apply -f-
```



```yaml
apiVersion: "istio.openshift.com/v1alpha1"
kind: "Installation"
metadata:
  name: "istio-installation"
spec:
  deployment_type: origin
  istio:
    authentication: false
  jaeger:
  kiali:
    username: admin
    password: admin
  launcher:
    openshift:
      user: user7
      password: dummypass
    github:
      username: username
      token: token
    catalog:
      filter: booster.mission.metadata.istio
      branch: v62
      repo: https://github.com/fabric8-launcher/launcher-booster-catalog.git
 ```
