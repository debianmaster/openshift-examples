oc create clusterquota for-user \
     --hard pods=10 \
     --hard secrets=20 \
     --project-annotation-selector openshift.io/sa.scc.uid-range='1000060000/10000'
