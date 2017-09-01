```sh
ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/byo/openshift-cluster/openshift-metrics.yml \
-e openshift_metrics_install_metrics=True \
-e openshift_metrics_cassandra_pvc_size=10Gi \
-e openshift_metrics_cassandra_storage_type=dynamic 
```


