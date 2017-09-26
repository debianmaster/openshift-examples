#!/bin/bash

. $(dirname ${BASH_SOURCE})/util.sh
backtotop

desc 'Run as cluster administrator'
run 'oc login -u system:admin'

backtotop
desc 'Install Istio'
desc 'Permissions'
run 'oc adm policy add-scc-to-user anyuid  -z default -n istio-system && \
     oc adm policy add-scc-to-user anyuid -z istio-ingress-service-account -n istio-system && \
     oc adm policy add-scc-to-user anyuid -z istio-egress-service-account -n istio-system && \
     oc adm policy add-scc-to-user anyuid -z default && \
     oc adm policy add-scc-to-user privileged  -z default'

backtotop
desc 'install istio'
run 'oc apply -f install/kubernetes/istio.yaml'  

backtotop
desc 'Install addons'
run 'oc apply -f install/kubernetes/addons/prometheus.yaml && \
     oc apply -f install/kubernetes/addons/grafana.yaml && \
     oc apply -f install/kubernetes/addons/servicegraph.yaml'

backtotop
desc 'Install sample app'
run 'open https://istio.io/docs/guides/bookinfo.html'
run 'oc apply -f <(istioctl kube-inject -f samples/bookinfo/kube/bookinfo.yaml)'
run 'oc get services'
run 'oc expose svc productpage'
run 'oc expose svc grafana -n istio-system'
