#!/bin/bash

. $(dirname ${BASH_SOURCE})/../util.sh
desc "Deploy Book Info application"
run 'oc apply -f <(istioctl kube-inject -f ~/istio/samples/bookinfo/kube/bookinfo.yaml -n myproject)'
