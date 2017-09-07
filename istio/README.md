
## Run as cluster administrator
`oc cluster up`  #openshift 3.7     
`oc login -u system:admin`

## Install Istio
`oc project myproject`  
`oc adm policy add-scc-to-user anyuid  -z default`  
`oc adm policy add-scc-to-user privileged -z default`  
`oc patch scc/privileged --patch {\"allowedCapabilities\":[\"NET_ADMIN\"]}`  



## Install Istio Service Mesh
`git clone https://github.com/istio/istio`   
`cd istio && git 3b31d818a1804e8d85e3396ed0f844c0893e2469`      
`cd ..`    




## Apply necessary permissions 

`oc adm policy add-cluster-role-to-user cluster-admin  -z default`   

`oc adm policy add-cluster-role-to-user cluster-admin -z istio-pilot-service-account`    
`oc adm policy add-cluster-role-to-user cluster-admin -z istio-ingress-service-account`    
`oc adm policy add-cluster-role-to-user cluster-admin -z istio-egress-service-account`  
`oc adm policy add-cluster-role-to-user cluster-admin -z istio-mixer-service-account`


`oc adm policy add-scc-to-user anyuid  -z istio-ingress-service-account`  
`oc adm policy add-scc-to-user privileged -z istio-ingress-service-account`   

`oc adm policy add-scc-to-user anyuid -z istio-egress-service-account`    
`oc adm policy add-scc-to-user privileged -z istio-egress-service-account`   

`oc adm policy add-scc-to-user anyuid  -z istio-pilot-service-account`  
`oc adm policy add-scc-to-user privileged -z istio-pilot-service-account` 


`oc apply -f install/kubernetes/istio.yaml`  



## Isntall addons 
`oc apply -f install/kubernetes/addons/prometheus.yaml`  
`oc apply -f install/kubernetes/addons/grafana.yaml`  
`oc apply -f install/kubernetes/addons/servicegraph.yaml`  



## Deploy sample app
### Install istioctl first and add to path  
`https://github.com/istio/istio/releases/tag/0.2.1`  


## Deploy bookInfo app
`source istio.VERSION`   #if you want stable versions in master   
`oc apply -f <(istioctl kube-inject --hub $PILOT_HUB --tag $PILOT_TAG -f samples/apps/bookinfo/bookinfo.yaml  -n myproject)`  
`oc expose svc servicegraph`  


## Test service mesh / using grafana pod (it can be another pod)   
`export GRAFANA=$(oc get pods -l app=grafana -o jsonpath={.items[0].metadata.name})`  
`oc exec $GRAFANA -- curl -o /dev/null -s -w "%{http_code}\n" http://istio-ingress/productpage`   
`open http://$(oc get routes servicegraph -o jsonpath={.spec.host})/dotviz` 


## Extra hacks
### Multin-namespace support
> By adding following two objects to any namespace you can make istio support it

```yaml
kind: "Service"
apiVersion: "v1"
metadata:
 name: "istio-pilot"
spec:
 type: ExternalName
 externalName: istio-pilot.myproject.svc.cluster.local
selector: {}
```

```yaml
apiVersion: v1
data:
  mesh: |-
    apiVersion: v1
    data:
      mesh: |-
        mixerAddress: istio-mixer.myproject.svc.cluster.local:9091
        discoveryAddress: istio-pilot.myproject.svc.cluster.local:8080
        ingressService: istio-ingress.myproject.svc.cluster.local
        statsdUdpAddress: istio-mixer.myproject.svc.cluster.local:9125
        zipkinAddress: zipkin.myproject.svc.cluster.local:9411
    kind: ConfigMap
    metadata:
      annotations:
      name: istio
kind: ConfigMap
metadata:
  name: istio
```
