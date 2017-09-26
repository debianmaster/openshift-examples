#!/bin/bash

. $(dirname ${BASH_SOURCE})/../util.sh

backtotop

desc 'Spinup openshift cluster'
run 'oc create sa oshinko'

desc 'Necessary Permissions'
run 'oc policy add-role-to-user edit -z oshinko'

desc 'Deploy Oshinko web UI'
run 'oc new-app -f https://raw.githubusercontent.com/radanalyticsio/oshinko-webui/master/tools/ui-template.yaml'


