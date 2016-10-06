## Install CloudForms on OpensShift


### Create Project
`oc new-project cloudforms`

### Create Service account to run CF as
`oc create serviceaccount cfsa -n cloudforms`

### Enable cloudforms to run as root
`oadm policy add-scc-to-user privileged system:serviceaccount:cloudforms:cfsa`

### Create deployment
`oc new-app registry.access.redhat.com/cloudforms/cfme4`

### Enable CF to run as root (thx Ed Seymour for the patch )
`oc patch dc cfme4 -p '{"spec":{"template":{"spec":{"containers":[{"name":"cfme4","securityContext":{ "privileged":true } }],"serviceAccountName":"cfsa"}}}}'`

### Expose the Service as a router with pass through TLS

`oc expose service cfme4`
`oc patch route cfme4 -p '{"spec":{"tls":{"termination":"passthrough"},"port":{"targetPort":"443-tcp"}}}`


