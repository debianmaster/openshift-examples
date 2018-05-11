

```sh
oc new-project apig
oc process -f https://raw.githubusercontent.com/debianmaster/openshift-examples/master/3scale-api-gateway/3scale.template.yaml WILDCARD_DOMAIN=apig.apps.s8.core.rht-labs.com | oc apply -f-
```
