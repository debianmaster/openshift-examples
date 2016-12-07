```sh
oc create -f https://raw.githubusercontent.com/jboss-openshift/application-templates/master/jboss-image-streams.json
oc new-build --image-stream=jboss-webserver30-tomcat8-openshift --binary=true --name=myapp
oc start-build myapp --from-dir=.
```
