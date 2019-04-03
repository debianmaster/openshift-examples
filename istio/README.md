
## Run as cluster administrator

>  http://www.maistra.io/istiodocs/install/

### Install operator
```
oc new-project istio-operator
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


>  cleanup
```
#oc delete crd $(oc get crd | grep istio | awk '{print $1}')

oc delete project istio-system
oc delete csr istio-sidecar-injector.istio-system
oc get crd  | grep istio | awk '{print $1}' | xargs oc delete crd
oc get mutatingwebhookconfigurations  | grep istio | awk '{print $1}' | xargs oc delete mutatingwebhookconfigurations
oc get validatingwebhookconfiguration  | grep istio | awk '{print $1}' | xargs oc delete validatingwebhookconfiguration
oc get clusterroles  | grep istio | awk '{print $1}' | xargs oc delete clusterroles
oc get clusterrolebindings  | grep istio | awk '{print $1}' | xargs oc delete clusterrolebindings
```

## kiali installation
```sh
bash <(curl -L http://git.io/getLatestKiali)
```

### Kiali dashboard view role for a specific project

> role
```sh
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  namespace: dev
  name: istio-view
rules:
- apiGroups: ["networking.istio.io"]
  resources: ["virtualservices","destinationrules"]
  verbs: ["get", "watch", "list"]
- apiGroups: ["authentication.istio.io"]
  resources: ["policies"]
  verbs: ["get", "watch", "list"]

```
> rolebinding

```yaml
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: istio-view-rolebinding
  namespace: dev
subjects:
- kind: User
  name: <user>
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: istio-view 
  apiGroup: rbac.authorization.k8s.io
```

> Misc 

```sh
oc export dc welcome -oyaml | istioctl kube-inject -f- | oc apply -f-
```
