#!/bin/bash

. $(dirname ${BASH_SOURCE})/util.sh
backtotop

#run "oc patch deployment istio-ingress -n istio-system --type=json -p='[{\"op\": \"replace\", \"path\": \"/spec/template/spec/containers/0/ports\", \"value\":[{\"containerPort\":\"80\",\"hostPort\":\"80\",\"protocol\":\"TCP\"},{\"containerPort\":\"443\",\"hostPort\":\"443\",\"protocol\":\"TCP\"}]}]'"

desc 'Run as cluster administrator'
#run 'oc login -u system:admin'

backtotop
desc 'Install Istio'
desc 'Permissions'
run 'oc adm policy add-scc-to-user anyuid  -z default -n istio-system && \
     oc adm policy add-scc-to-user anyuid -z istio-ingress-service-account -n istio-system && \
     oc adm policy add-scc-to-user anyuid -z istio-egress-service-account -n istio-system && \
     oc adm policy add-scc-to-user privileged -z istio-ingress-service-account -n istio-system && \
     oc adm policy add-scc-to-user anyuid -z default && \
     oc adm policy add-scc-to-user privileged  -z default'

backtotop
desc 'install istio'
run 'cd ~/istio'
run 'oc apply -f install/kubernetes/istio.yaml'  

backtotop
desc 'Install addons'
run 'oc apply -f install/kubernetes/addons/prometheus.yaml && \
     oc apply -f install/kubernetes/addons/grafana.yaml && \
     oc apply -f install/kubernetes/addons/servicegraph.yaml'

backtotop
desc 'Disable openshift router & Use Istio-Ingress'
#run 'oc scale dc router --replicas=0 -n default'
