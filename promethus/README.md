##  Prometheus and Grafana on Openshift Origin

### Deploy Prometheus & Grafana
```sh
oc project openshift-infra   #choose a namespace
oc adm policy add-cluster-role-to-user cluster-reader -z default  #for the default account give cluster wide read permission so prometheus can read metrics
oc adm policy add-scc-to-user anyuid -z default   #damn!  allow containers with root USER will fix in future
oc new-app grafana/grafana   #Deploy grafana
oc volume dc/grafana --remove --name=grafana-volume-1  #Some strange fix to make grafana work
oc volume dc/grafana --remove --name=grafana-volume-2  #Some strange fix to make grafana work
oc new-app prom/prometheus     #deploy latest prometheus
oc create -f https://raw.githubusercontent.com/debianmaster/openshift-examples/master/promethus/prom-configmap.yml     #mount this configmap at at /etc/prometheus/prometheus.yml  #Scrape rules for prometheus 
oc set volume dc/prometheus --add --name=prom-k8s -m /etc/prometheus -t configmap --configmap-name=prom-k8s  #set rules inside prom 
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
