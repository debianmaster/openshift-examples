#!/bin/bash

. $(dirname ${BASH_SOURCE})/../util.sh


backtotop
desc 'Custom Microservice applications'
desc 'Lets add openshift controller which automatically injects istio proxy'
run 'oc new-app debianmaster/istio-controller'

desc 'Deploy microservice 1'
run 'oc new-app debianmaster/nodejs-welcome --name=app1 -l version=v1'
desc 'Note: appnames should not have `-`  in it and you need to add version label as of now`

backtotop
desc 'Apply label istio=true so that sidecar is injected'
run 'oc label dc app1 istio=true'


 
