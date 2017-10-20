#!/bin/bash

. $(dirname ${BASH_SOURCE})/util.sh

backtotop
desc 'Timeouts'
run 'cd ~/istio'

backtotop
desc 'Clear any existing route rules'
run 'oc delete routerules --all'

backtotop
desc 'Route all traffic to v1'
run 'oc apply -f samples/bookinfo/kube/route-rule-all-v1.yaml'

backtotop
desc 'Always route reviews requests to v2'
run 'cat <<EOF | istioctl replace -f -
apiVersion: config.istio.io/v1alpha2
kind: RouteRule
metadata:
  name: reviews-default
  namespace: myproject
spec:
  destination:
    name: reviews
  route:
  - labels:
      version: v2
EOF'

backtotop
desc 'Add 5 second delay on ratings service when called from reviews v2'
run 'cat <<EOF | istioctl replace -f -
apiVersion: config.istio.io/v1alpha2
kind: RouteRule
metadata:
  name: ratings-default
  namespace: myproject
spec:
  destination:
    name: ratings
  route:
  - labels:
      version: v1
  httpFault:
    delay:
      percent: 100
      fixedDelay: 5s
EOF'


backtotop
desc 'Set 2 second timeout on reviews v2 service'
run 'cat <<EOF | istioctl replace -f -
apiVersion: config.istio.io/v1alpha2
kind: RouteRule
metadata:
  name: reviews-default
  namespace: myproject
spec:
  destination:
    name: reviews
  route:
  - labels:
      version: v2
  httpReqTimeout:
    simpleTimeout:
      timeout: 2s
EOF'


