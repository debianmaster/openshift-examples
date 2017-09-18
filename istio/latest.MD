```sh
 507   oc adm policy add-scc-to-user anyuid -z istio-ingress-service-account -n istio-system
  508   oc adm policy add-scc-to-user anyuid -z istio-egress-service-account -n istio-system
  509  oc apply -f install/kubernetes/istio-rbac-beta.yaml
  510  oc apply -f install/kubernetes/istio.yaml
  511  k get pods -n istio-system
  512  k get pods -n istio-system -w
  513  kubectl apply -f install/kubernetes/addons/prometheus.yaml
  514  kubectl apply -f install/kubernetes/addons/grafana.yaml
  515  kubectl apply -f install/kubernetes/addons/servicegraph.yaml
  oc adm policy add-scc-to-user anyuid -z default -n istio-system
  oc adm policy add-scc-to-user anyuid -z default -n demo
  ```
  
  ```console
  There is no write permission for server directory /opt/ibm/wlp/output/defaultServer
  ```
