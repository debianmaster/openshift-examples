### Install
```hosts
grafana_namespace=openshift-grafana
grafana_user=monit
grafana_prometheus_namespace="openshift-metrics"
grafana_graph_granularity="2m"
grafana_password=supersecret
```

### Run installer
```
ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/openshift-grafana/config.yml
```


### Custom URL for grafna
> 1) Create custom url with Re-encrypt https route.  Oauth will fail with proxy error 
```
oc edit sa grafana -n openshift-grafana
```
>  change `serviceaccounts.openshift.io/oauth-redirectreference.primary`  with correct route name to use your custom url
