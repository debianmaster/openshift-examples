> https://blog.openshift.com/how-to-enable-static-egress-ip-in-ocp/

##  assign a new ip to one of the nodes
```sh
oc patch hostsubnet node2.ocp.io -p '{"egressIPs": ["192.168.1.102"]}'
```

## verify
```sh
oc get hostsubnet
```

## set egress traffic static ip for a namespace.
```
oc patch netnamespace egress-test -p '{"egressIPs": ["192.168.1.102"]}'
```
