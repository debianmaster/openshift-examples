> How to run pods in a specific namespace with fixe range uuid's .  


`oc edit namespace <namespace>` .  
Add following annotaiton .  
 `openshift.io/sa.scc.uid-range: 1001/10000`
