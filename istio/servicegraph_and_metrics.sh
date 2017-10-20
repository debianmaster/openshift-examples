#!/bin/bash

. $(dirname ${BASH_SOURCE})/util.sh

backtotop
desc 'Service graph & Metrics'
run 'cd ~/istio'

backtotop

desc 'expose & open service graph'
run 'oc expose svc servicegraph -n istio-system'
run 'open http://servicegraph-istio-system.127.0.0.1.nip.io/dotviz'

desc 'expose and open metrics'
run 'oc expose svc grafana -n istio-system'
run 'open http://grafana-istio-system.127.0.0.1.nip.io'

desc 'Open product page application'
run 'open http://productpage-myproject.127.0.0.1.nip.io'
