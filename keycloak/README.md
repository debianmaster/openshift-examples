```sh
oc cluster up 
oc adm policy add-scc-to-user anyuid -z default
oc new-app jboss/keycloak --name=auth -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=password
```
