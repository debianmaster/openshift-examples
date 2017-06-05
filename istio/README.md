```sh
curl -L https://git.io/getIstio | sh -
export PATH="$PATH:/Users/jjonagam/istio/istio-0.1.5/bin"



oc project default



oc adm policy add-scc-to-user anyuid  -z default
oc adm policy add-scc-to-user privileged -z default



kubectl apply -f install/kubernetes/istio.yaml

oc adm policy add-cluster-role-to-user cluster-admin -z istio-manager-service-account
oc adm policy add-cluster-role-to-user cluster-admin -z istio-ingress-service-account
oc adm policy add-cluster-role-to-user cluster-admin  -z default

oc adm policy add-scc-to-user anyuid  -z istio-ingress-service-account
oc adm policy add-scc-to-user privileged -z istio-ingress-service-account


oc adm policy add-scc-to-user anyuid  -z istio-manager-service-account
oc adm policy add-scc-to-user privileged -z istio-manager-service-account



kubectl apply -f install/kubernetes/addons/prometheus.yaml
kubectl apply -f install/kubernetes/addons/grafana.yaml
kubectl apply -f install/kubernetes/addons/servicegraph.yaml

# ADD SCC

kubectl apply -f <(istioctl kube-inject  -f samples/apps/bookinfo/bookinfo.yaml)


oc new-project mycliproject-christianh814 --description="My CLI Project" --display-name="CLI Project"

curl -o /dev/null -s -w "%{http_code}\n" http://istio-ingress/productpage

```
