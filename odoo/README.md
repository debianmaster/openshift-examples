### Odoo on openshift

```sh
oc new-app \
    -e POSTGRES_USER=odoo     \
    -e POSTGRES_PASSWORD=odoo  \
    -e POSTGRES_DB=postgres   \
    --name=db postgres:9.6 --name=db
oc new-app -e DB_ENV_POSTGRES_USER=odoo odoo:12 --name=web

oc expose svc web
oc get routes -l app=web

```
