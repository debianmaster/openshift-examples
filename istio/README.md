
## Run as cluster administrator
`oc login -u system:admin`

## Install Istio
`oc project default`
`oc adm policy add-scc-to-user anyuid  -z default`
`oc adm policy add-scc-to-user privileged -z default``
`oc patch scc/privileged --patch `{\"allowedCapabilities\":[\"NET_ADMIN\"]}``



## Install Istio Service Mesh
`git clone https://github.com/istio/istio`




## Apply necessary permissions 

`oc adm policy add-cluster-role-to-user cluster-admin -z istio-manager-service-account` 
`oc adm policy add-cluster-role-to-user cluster-admin -z istio-ingress-service-account` 
`oc adm policy add-cluster-role-to-user cluster-admin  -z default` 

`oc adm policy add-scc-to-user anyuid  -z istio-ingress-service-account` 
`oc adm policy add-scc-to-user privileged -z istio-ingress-service-account` 

`oc adm policy add-scc-to-user anyuid  -z istio-manager-service-account` 
`oc adm policy add-scc-to-user privileged -z istio-manager-service-account` 
`oc apply -f istio/install/kubernetes/istio.yaml` 



## Isntall addons 
`oc apply -f istio/install/kubernetes/addons/prometheus.yaml` 
`oc apply -f istio/install/kubernetes/addons/grafana.yaml` 
`oc apply -f istio/install/kubernetes/addons/servicegraph.yaml` 



## Deploy sample app
### Install istioctl first` 
`curl -L https://git.io/getIstio | sh -` 
`export PATH="$PATH:/Users/jjonagam/istio/istio-0.1.5/bin"` 


## Deploy bookInfo app
`oc apply -f <(istioctl kube-inject  -f istio/samples/apps/bookinfo/bookinfo.yaml)` 
`oc expose svc servicegraph` 


## Test service mesh / using grafana pod (it can be another pod) 
`export GRAFANA=$(oc get pods -l app=grafana -o jsonpath={.items[0].metadata.name})` 
`oc exec $GRAFANA -- curl -o /dev/null -s -w "%{http_code}\n" http://istio-ingress/productpage` 
