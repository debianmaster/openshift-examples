
```sh

oc cluster up 
oc adm policy add-scc-to-user anyuid -z default
oc create -f https://raw.githubusercontent.com/jboss-dockerfiles/hawkular-apm/master/openshift-templates/hawkular-apm-server-deployment.yml
git clone https://github.com/hawkular/hawkular-apm.git
cd examples/polyglot-zipkin/
export KAFKA_ZOOKEEPER=zookeeper
export TRACING_SERVER=hawkular-apm
export TRACING_PORT=80
oc import docker-compose -f docker-compose.yml 
## wait for deployment
oc expose svc js
curl http://js-myproject.10.0.0.249.xip.io/hello

```
