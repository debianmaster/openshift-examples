## Install CloudForms on OpensShift


### Create Project
`oc new-project cloudforms`

### Create Service account to run CF as
`oc create serviceaccount cfsa -n cloudforms`

### Enable cloudforms to run as root
`oc adm policy add-scc-to-user privileged system:serviceaccount:cloudforms:cfsa`

### Create deployment
`oc new-app registry.access.redhat.com/cloudforms/cfme4`

### Enable CF to run as root (thx Ed Seymour for the patch )
`oc patch dc cfme4 -p '{"spec":{"template":{"spec":{"containers":[{"name":"cfme4","securityContext":{ "privileged":true } }],"serviceAccountName":"cfsa"}}}}'`

### Expose the Service as a router with pass through TLS

`oc expose service cfme4`      
`oc patch route cfme4 -p '{"spec":{"tls":{"termination":"passthrough"},"port":{"targetPort":"443-tcp"}}}'`


### Give cluster read permissions 
`oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:cloudforms:cfsa`

### Get service token

`oc sa  get-token cfsa`

### Setup CloudForm with OCP
Hit  https://cfme4-cloudforms.10.0.0.249.xip.io/     
username/password:    admin/smartvm     
Hit https://cfme4-cloudforms.10.0.0.249.xip.io/ems_container/new     

Endpoints    
kubernetes.default.svc.cluster.local    port 443  and token
  
Hawkular    
provide hawkular skydns   i.e.   hawkular-metrics.openshift-infra.svc.cluster.local  

### Wait for some time for results to show up  
