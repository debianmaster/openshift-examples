oc cluster up --image=registry.access.redhat.com/openshift3/ose --version=latest
oc cluster up --public-hostname='ocp.ck.osecloud.com' --metrics=true --image=registry.access.redhat.com/openshift3/ose --version=latest --routing-suffix='ocp.ck.osecloud.com'
### add section for multi-master multi-etcd vagrant image
