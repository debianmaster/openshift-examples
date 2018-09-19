```sh
oc create configmap my-config --from-file=./standalone.xml
oc volumes dc DC_NAME --add --name=my-config --configmap-name=my-config --default-mode=0777 --mount-path=/opt/eap/standalone/configuration/standalone.xml --sub-path=standalone.xml

```
