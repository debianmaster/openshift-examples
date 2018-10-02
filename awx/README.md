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
remove resource limits from DC if you see nodes not available message
try 2-3 times if you see failures
```


> Temporary fix for a bug
```
oc env dc awx -c awx-web DATABASE_USER=awx,DATABASE_NAME=awx DATABASE_HOST=postgresql DATABASE_PASSWORD=awxpass DATABASE_PORT=5432 MEMCACHED_HOST=localhost RABBITMQ_HOST=localhost AWX_ADMIN_USER=admin AWX_ADMIN_PASSWORD=password RABBITMQ_USE_LONGNAME=true K8S_SERVICE_NAME=rabbitmq RABBITMQ_ERLANG_COOKIE=cookiemonster
```
