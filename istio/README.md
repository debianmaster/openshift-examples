```sh
curl -L https://git.io/getIstio | sh -
export PATH="$PATH:/Users/jjonagam/istio/istio-0.1.5/bin"
oc adm policy add-scc-to-user anyuid  -z default
oc adm policy add-scc-to-user privileged -z default
kubectl apply -f install/kubernetes/istio.yaml
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:istio:istio-manager-service-account
# add NET_ADMIN capability to scc privileged to defaultAddCapabilities
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:istio:istio-ingress-service-account
oc adm policy add-cluster-role-to-user cluster-admin  system:serviceaccount:istio:default
oc adm policy add-scc-to-user anyuid  -z istio-ingress-service-account
oc adm policy add-scc-to-user privileged -z istio-ingress-service-account
oc adm policy add-scc-to-user anyuid  -z istio-manager-service-account
oc adm policy add-scc-to-user privileged -z istio-manager-service-account
kubectl apply -f install/kubernetes/addons/prometheus.yaml
kubectl apply -f install/kubernetes/addons/grafana.yaml
kubectl apply -f install/kubernetes/addons/servicegraph.yaml
kubectl apply -f <(istioctl kube-inject -n istio -f samples/apps/bookinfo/bookinfo.yaml)

```
