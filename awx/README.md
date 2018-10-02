> oc login first
> deploy awx on openshift

```sh
git clone https://github.com/ansible/awx.git
cd awx
cd installer
oc new-project awx
```

```sh
export openshift_host=$(oc config view --minify -o jsonpath='{.clusters[*].cluster.server}')
ansible-playbook -i inventory install.yml -e openshift_host=$openshift_host -e openshift_project=awx -e openshift_user=$(oc whoami) -e openshift_password=$(oc whoami -t) -e docker_registry_password=$(oc whoami -t) -e openshift_skip_tls_verify=True -e openshift_pg_emptydir=True
```


```sh
try 2-3 times if you see failures
```
