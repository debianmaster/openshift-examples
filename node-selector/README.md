```sh
oc patch dc/<dcname> \
   -p '{"spec":{"template":{"spec":{"nodeSelector":{"<label_name>":"<label_value>"}}}}}'
```
