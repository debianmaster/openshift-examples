#!/bin/bash

. $(dirname ${BASH_SOURCE})/util.sh

backtotop
desc 'Requesting routing'
run 'cd ~/istio'

backtotop
desc 'Clear any existing route rules'
run 'oc delete routerules --all'

desc 'Route all traffic to v1'
run 'oc apply -f samples/bookinfo/kube/route-rule-all-v1.yaml'
run  'oc get routerule reviews-default  -o yaml | yq .spec'

backtotop
desc 'For a user jason route to v2'
run  'oc apply -f samples/bookinfo/kube/route-rule-reviews-test-v2.yaml'
run  'oc get routerule reviews-test-v2  -o yaml | yq .spec' 

backtotop
desc 'For all users split traffic between v1 and v3'
run 'oc apply -f samples/bookinfo/kube/route-rule-reviews-50-v3.yaml'
run 'oc get routerule reviews-default  -o yaml | yq .spec'

backtotop
desc 'Route all traffic to v3'
run 'oc apply -f samples/bookinfo/kube/route-rule-reviews-v3.yaml'
run 'oc get routerule reviews-default  -o yaml | yq .spec'


