#!/bin/bash

. $(dirname ${BASH_SOURCE})/../util.sh


backtotop
desc 'Integrating services into istio'
desc 'Lets look at apps.yaml'
run 'open https://istio.io/docs/tasks/integrating-services-into-istio.html'
run 'istioctl kube-inject -f apps.yaml'
run 'kubectl apply -f <(istioctl kube-inject -f apps.yaml)'
run 'oc get pods'
run "CLIENT=$(kubectl get pod -l app=service-one -o jsonpath='{.items[0].metadata.name}')"
run "SERVER=$(kubectl get pod -l app=service-two -o jsonpath='{.items[0].metadata.name}')"
run "kubectl exec -it ${CLIENT} -c app -- curl service-two:80 | grep x-request-id"
run "request_id=$(kubectl exec -it ${CLIENT} -c app -- curl service-two:80 | grep x-request-id)"

desc "kubectl logs ${CLIENT} proxy | grep requuest_id"
desc "kubectl logs ${SERVER} proxy | grep request_id"
run "kubectl exec -it ${SERVER} -c app -- curl localhost:8080 | grep x-request-id"





 
