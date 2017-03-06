### Deploy Prometheus & Grafana
```sh
oc project openshift-infra
oc adm policy add-cluster-role-to-user cluster-reader -z default
oc adm policy add-scc-to-user anyuid -z default 
oc new-app grafana/grafana  
oc volume dc/grafana --remove --name=grafana-volume-1
oc new-app prom/prometheus
oc create -f prom-configmap.yml     #mount this configmap at at /etc/prometheus/prometheus.yml
oc volume dc/prometheus --add --name=prom-k8s -m /etc/prometheus -t configmap --configmap-name=prom-k8s
```

### Add prometheus as Datasource & Dashboard in grafna  
##### Data source
`Grafana menu -> Data Sources -> Add Data source -> fill following values` 
![Data Source](./add-ds.png?raw=true "Data Source")

Caution:  when putting prometheus URL always use public url with no trailing "/"  ex:-   
http://prometheus-openshift-infra.10.0.0.249.xip.io

##### Create Dashboard
`Grafana menu -> Dashboards -> import`       
`Import grafana-dashboard.json`









### Reference links
https://grafana.net/dashboards/315
https://github.com/giantswarm/kubernetes-prometheus
http://www.hawkular.org/blog/2016/10/24/hawkular-metrics-openshift-and-grafana.html

### Proxy UI to localhost
`kubectl get pods -l app=prometheus -o name | sed 's/^.*\///' | xargs -I{} kubectl port-forward {} 9090:9090`
 Open localhost:9090   
