```sh
ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/byo/openshift-cluster/openshift-logging.yml \
-e openshift_logging_install_logging=True \
-e openshift_logging_es_pvc_dynamic=True \
-e openshift_logging_es_pvc_size=10Gi 
```


