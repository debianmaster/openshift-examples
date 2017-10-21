> Once you are happy with all the components of your app, you may want to convert everything into a template.

```sh
oc project <yourproject>
oc export bc,dc,svc,route,is,secret  --as-template=myapp  > myapp-template.yaml
```
> Import template

```sh
oc apply -f myapp-template.yaml
```
