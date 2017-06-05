#!/bin/bash

. $(dirname ${BASH_SOURCE})/../util.sh

backtotop

desc 'Run as cluster administrator'
run 'oc login -u system:admin'

backtotop

desc 'Install Istio'

run 'oc project default'
run 'oc adm policy add-scc-to-user anyuid  -z default'
run 'oc adm policy add-scc-to-user privileged -z default'
run "oc patch scc/privileged --patch '{\"allowedCapabilities\":[\"NET_ADMIN\"]}'"

backtotop

desc 'Install Istio Service Mesh'
run 'git clone https://github.com/istio/istio'
run 'oc apply -f istio/install/kubernetes/istio.yaml'

backtotop

desc 'Apply necessary permissions '

run 'oc adm policy add-cluster-role-to-user cluster-admin -z istio-manager-service-account'
run 'oc adm policy add-cluster-role-to-user cluster-admin -z istio-ingress-service-account'
run 'oc adm policy add-cluster-role-to-user cluster-admin  -z default'

run 'oc adm policy add-scc-to-user anyuid  -z istio-ingress-service-account'
run 'oc adm policy add-scc-to-user privileged -z istio-ingress-service-account'

run 'oc adm policy add-scc-to-user anyuid  -z istio-manager-service-account'
run 'oc adm policy add-scc-to-user privileged -z istio-manager-service-account'

backtotop

desc 'Isntall addons'
run 'oc apply -f istio/install/kubernetes/addons/prometheus.yaml'
run 'oc apply -f istio/install/kubernetes/addons/grafana.yaml'
run 'oc apply -f istio/install/kubernetes/addons/servicegraph.yaml'

backtotop

desc 'Deploy sample app'
desc 'Install istioctl first'
desc 'curl -L https://git.io/getIstio | sh -'
desc 'export PATH="$PATH:/Users/jjonagam/istio/istio-0.1.5/bin"'

backtotop
desc 'Deploy bookInfo app'
run 'oc apply -f <(istioctl kube-inject  -f istio/samples/apps/bookinfo/bookinfo.yaml)'
run 'oc expose svc servicegraph'

backtotop
desc 'Test service mesh / using grafana pod (it can be another pod)'
run 'export GRAFANA=$(oc get pods -l app=grafana -o jsonpath={.items[0].metadata.name})'
run 'oc exec $GRAFANA -- curl -o /dev/null -s -w "%{http_code}\n" http://istio-ingress/productpage'

