### If you have PV

```sh
ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/byo/openshift-cluster/openshift-metrics.yml \
-e openshift_metrics_install_metrics=True \
-e openshift_metrics_hawkular_hostname=hawkular.apps.172.16.1.10.nip.io \
-e openshift_metrics_cassandra_storage_type=dynamic \
-e openshift_metrics_cassandra_pvc_size=10Gi
```

### If you dont have PV
```sh
ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/byo/openshift-cluster/openshift-metrics.yml \
   -e openshift_metrics_install_metrics=True \
   -e openshift_metrics_hawkular_hostname=hawkular-metrics.example.org
```


### Clean up 
```sh
ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/byo/openshift-cluster/openshift-metrics.yml \
   -e openshift_metrics_install_metrics=False
 ```
