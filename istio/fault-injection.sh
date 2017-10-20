#!/bin/bash

. $(dirname ${BASH_SOURCE})/util.sh

backtotop
desc 'Fault injection'
run 'cd ~/istio'

backtotop

desc 'Clear any existing route rules'
run 'oc delete routerules --all'

backtotop
desc 'Route all traffic to v1'
run 'oc apply -f samples/bookinfo/kube/route-rule-all-v1.yaml'

backtotop
desc 'For user jason always route to v2 of reviews'
run 'oc apply -f samples/bookinfo/kube/route-rule-reviews-test-v2.yaml'
run  'oc get routerule reviews-test-v2  -o yaml | yq .spec'

backtotop
desc 'For user jason introduct a delay of 7s on ratings'
run 'oc apply -f samples/bookinfo/kube/route-rule-ratings-test-delay.yaml'
run  'oc get routerule ratings-test-delay  -o yaml | yq .spec'
