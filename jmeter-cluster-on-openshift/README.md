```sh
oc new-project jm
oc adm policy add-scc-to-user anyuid -z default -n jm
helm install --name jmeter stable/distributed-jmeter

export MASTER_NAME=$(kubectl get pods -l app.kubernetes.io/component=master -o jsonpath='{.items[*].metadata.name}')

export SERVER_IPS=$(kubectl get pods -l app.kubernetes.io/component=server -o jsonpath='{.items[*].status.podIP}' | tr ' ' ',')
sleep 6

wget https://raw.githubusercontent.com/pedrocesar-ti/distributed-jmeter-docker/master/local/test/sample.jmx

oc cp sample.jmx $MASTER_NAME:/jmeter

oc rsh  $MASTER_NAME  jmeter -n -t /jmeter/sample.jmx #-R $SERVER_IPS

```
