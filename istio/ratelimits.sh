#!/bin/bash

. $(dirname ${BASH_SOURCE})/util.sh

backtotop
desc 'Rate limits'
run ''

backtotop

desc 'Clear any existing route rules'
run 'oc delete routerules --all && \
     oc delete -f ratelimit-handler.yaml && \
     oc delete -f ratelimit-rule.yaml'


backtotop
desc 'Configure ratelimit handler'
run 'cat ratelimit-handler.yaml | yq .'
run 'oc apply -f ratelimit-handler.yaml'


backtotop
desc 'Configure Quota'
run 'cat ratelimit-rule.yaml | yq .'
run 'oc apply -f ratelimit-rule.yaml'


backtotop
desc 'From v2 version of reviews call ratings'
run "REVIEWS_V2_POD=$(oc get po -l app=reviews -l version=v2 -o jsonpath='{.items[0].metadata.name}')"
desc 'watch -n 0.5 oc rsh $REVIEWS_V2_POD wget http://ratings:9080/ratings/1'
run 'watch -n 0.5 oc rsh $REVIEWS_V2_POD wget http://ratings:9080/ratings/1'

