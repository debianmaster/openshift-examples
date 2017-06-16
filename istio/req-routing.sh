#!/bin/bash

. $(dirname ${BASH_SOURCE})/../util.sh


backtotop
desc 'Set route rule so only all users can see just v1'
run 'cd istio'
run 'istioctl get route-rules'
run 'istioctl create -f samples/apps/bookinfo/route-rule-all-v1.yaml'
run 'istioctl get route-rules'

backtotop
desc 'Set route rule so only jason can see v2'
run 'istioctl create -f samples/apps/bookinfo/route-rule-reviews-test-v2.yaml'
run 'istioctl get route-rule reviews-test-v2'


backtotop
desc 'Split traffic between v1 and v3 50% each'
run 'istioctl replace -f samples/apps/bookinfo/route-rule-reviews-50-v3.yaml'


 
