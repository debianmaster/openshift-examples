### Deploy Prometheus
```sh
oc project openshift-infra
oc adm policy add-cluster-role-to-user cluster-reader system:serviceaccount:openshift-infra:default
oc adm policy add-scc-to-user anyuid -z default 
oc new-app grafana/grafana  
oc volume dc/grafana --remove --name=grafana-volume-1
oc new-app prom/prometheus
oc create -f prom-configmap.yml     #mount this configmap at at /etc/prometheus/prometheus.yml

#add prometheus as Datasource in grafna  


```




### Others
https://grafana.net/dashboards/315
https://github.com/giantswarm/kubernetes-prometheus
http://www.hawkular.org/blog/2016/10/24/hawkular-metrics-openshift-and-grafana.html

### Proxy UI to localhost
`kubectl get pods -l app=prometheus -o name | sed 's/^.*\///' | xargs -I{} kubectl port-forward {} 9090:9090`
 Open localhost:9090   
