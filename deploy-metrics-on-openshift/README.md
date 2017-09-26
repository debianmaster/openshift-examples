

ansible-playbook <OPENSHIFT_ANSIBLE_DIR>/byo/openshift-cluster/openshift-metrics.yml \
   -e openshift_metrics_install_metrics=True \
   -e openshift_metrics_hawkular_hostname=hawkular-metrics.example.com
   
   

### Deploy metrics on openshift origin
```sh
export OCP_DOMAIN=example.com
wget https://raw.githubusercontent.com/openshift/origin-metrics/master/metrics-deployer-setup.yaml
wget https://raw.githubusercontent.com/openshift/origin-metrics/master/metrics.yaml

oc create -f metrics-deployer-setup.yaml -n openshift-infra
oc adm policy add-role-to-user edit \
        system:serviceaccount:openshift-infra:metrics-deployer \
        -n openshift-infra
oc adm policy add-cluster-role-to-user cluster-reader \
        system:serviceaccount:openshift-infra:heapster \
        -n openshift-infra
        
oc secrets new metrics-deployer nothing=/dev/null -n openshift-infra

oc process -f metrics.yaml -v \
     HAWKULAR_METRICS_HOSTNAME=hawkular-metrics.{{OCP_DOMAIN}},USE_PERSISTENT_STORAGE=false \
     | oc create -n openshift-infra -f -
```

> Change master Config  master-config.yaml    
/var/lib/origin/openshift.local.config/master/master-config.yaml

```sh
assetConfig:
    ...
    metricsPublicURL: "https://hawkular-metrics.example.com/hawkular/metrics"
```
> Restart Master service


### Cleanup 
```sh
oc delete all,secrets,sa,templates --selector=metrics-infra -n openshift-infra
```

###  On OCP - enterprise
```sh
oc project openshift-infra
oc adm policy add-role-to-user view system:serviceaccount:openshift-infra:hawkular -n openshift-infra
oc create -f - <<API
apiVersion: v1
kind: ServiceAccount
metadata:
  name: metrics-deployer
secrets:
- name: metrics-deployer
API
oadm policy add-role-to-user     edit system:serviceaccount:openshift-infra:metrics-deployer
oadm policy add-cluster-role-to-user     cluster-reader system:serviceaccount:openshift-infra:heapster
oc secrets new metrics-deployer nothing=/dev/null
oc secrets link default metrics-deployer
cd /usr/share/openshift/hosted
oc process -f metrics-deployer.yaml     -v HAWKULAR_METRICS_HOSTNAME=hawkular-metrics.ocp.ck.osecloud.com     -v USE_PERSISTENT_STORAGE=false     | oc create -f -
