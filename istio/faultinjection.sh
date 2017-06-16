#!/bin/bash

. $(dirname ${BASH_SOURCE})/../util.sh


backtotop
desc 'Fault injection into services'
desc 'Lets add some delay to a service'
run 'open https://istio.io/docs/tasks/fault-injection.html'
run 'istioctl create -f istio/samples/apps/bookinfo/route-rule-all-v1.yaml'
run 'istioctl create -f istio/samples/apps/bookinfo/route-rule-reviews-test-v2.yaml'
run 'istioctl create -f istio/samples/apps/bookinfo/destination-ratings-test-delay.yaml'
run 'istioctl get route-rule ratings-test-delay'


 
