#!/bin/bash

. $(dirname ${BASH_SOURCE})/../util.sh

desc 'Install Istio'

run 'oc project default'
run 'oc adm policy add-scc-to-user anyuid  -z default'
run 'oc adm policy add-scc-to-user privileged -z default'
run "oc patch scc/privileged --patch '{"allowedCapabilities":["NET_ADMIN"]}'"

desc "Install Istio Service Mesh"
run 'git clone https://github.com/istio/istio .'
run 'oc apply -f install/kubernetes/istio.yaml'

run 'oc adm policy add-cluster-role-to-user cluster-admin -z istio-manager-service-account'
run 'oc adm policy add-cluster-role-to-user cluster-admin -z istio-ingress-service-account'
run 'oc adm policy add-cluster-role-to-user cluster-admin  -z default'

run 'oc adm policy add-scc-to-user anyuid  -z istio-ingress-service-account'
run 'oc adm policy add-scc-to-user privileged -z istio-ingress-service-account'


run 'oc adm policy add-scc-to-user anyuid  -z istio-manager-service-account'
run 'oc adm policy add-scc-to-user privileged -z istio-manager-service-account'


desc 'Isntall addons'
run 'oc apply -f install/kubernetes/addons/prometheus.yaml'
run 'oc apply -f install/kubernetes/addons/grafana.yaml'
run 'oc apply -f install/kubernetes/addons/servicegraph.yamli'


desc 'Deploy sample app'
run 'oc apply -f <(istioctl kube-inject  -f samples/apps/bookinfo/bookinfo.yaml)'


oc new-project mycliproject-christianh814 --description="My CLI Project" --display-name="CLI Project"

curl -o /dev/null -s -w "%{http_code}\n" http://istio-ingress/productpage

```
