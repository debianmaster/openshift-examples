### If you have PV

```sh
 ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/byo/openshift-cluster/openshift-metrics.yml \
   -e openshift_metrics_install_metrics=True \
   -e openshift_metrics_hawkular_hostname=hawkular-metrics.example.org \
   -e openshift_metrics_cassandra_storage_type=pv
```

### If you dont have PV
```sh
ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/byo/openshift-cluster/openshift-metrics.yml \
   -e openshift_metrics_install_metrics=True \
   -e openshift_metrics_hawkular_hostname=hawkular-metrics.example.org
```
