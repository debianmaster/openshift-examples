```sh
oc get nodes --show-labels=true
oc patch dc/<dcname> -p '{"spec":{"template":{"spec":{"nodeSelector":{"<label_name>":"<label_value>"}}}}}'
```
