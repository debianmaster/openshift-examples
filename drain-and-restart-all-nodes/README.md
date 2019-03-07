> OCP 3.9  
```
for i in $(oc get nodes  | awk '{print $1}' | awk '{if(NR>1)print}')
do
   oc adm manage-node $i  --schedulable=false 
   oc adm drain $i  --delete-local-data --force --ignore-daemonsets
   ansible $i -a "systemctl stop atomic-openshift-master-api" --ask-pass
   ansible $i -a "systemctl stop atomic-openshift-master-controllers" --ask-pass
   ansible $i -a "systemctl stop atomic-openshift-node" --ask-pass
   sleep 10
done 
```
