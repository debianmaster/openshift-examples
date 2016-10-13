### Deploy metrics on openshift origin

```sh
export OCP_DOMAIN=example.com
wget https://github.com/openshift/origin-metrics/blob/master/metrics-deployer-setup.yaml
wget https://github.com/openshift/origin-metrics/blob/master/metrics.yaml

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

