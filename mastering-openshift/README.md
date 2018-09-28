> I'll try to cover learning path for openshift. so its easy for folks to start openshift journey.


1. Do all the courses on  http://learn.openshift.com/

![courses](https://raw.githubusercontent.com/debianmaster/openshift-examples/master/mastering-openshift/Screen%20Shot%202018-09-28%20at%202.37.58%20PM.png)

2. Try `oc cluster up`
> install docker for mac/windows/linux and try   `oc cluster up` command to bootstrap a local openshift cluster

3. Try `minishift`
> Install minishift or CDK and bootstrap a local openshift cluster
> Explore minishift addons


4. Try installing single node openshift cluster
>  Openshift with on single node using `openshift-ansible` https://github.com/openshift/openshift-ansible.git  gitghub repo

5. Try installing single master multi-node openshift cluster
> Openshift cluster with  1 master and multiple nodes using https://github.com/openshift/openshift-ansible.git

6. Try installing multi-master multi-node openshift cluster


7. Try installing 1 master multi-node cluster with logging 
>  configure logging using logging playbook available at https://github.com/openshift/openshift-ansible/tree/master/playbooks/openshift-logging


8. Try installing 1 master multi-node cluster with logging / monitoring - prometheus
>  configure logging using logging playbook available at https://github.com/openshift/openshift-ansible/tree/master/playbooks/openshift-logging
> configure monitoring using https://github.com/openshift/openshift-ansible/tree/master/playbooks/openshift-monitoring

9.  Try adding additonal components to #8
> components like  metrics/monitoring/operator console available at https://github.com/openshift/openshift-ansible/tree/master/playbooks


10. Try adding Gluster storage
https://github.com/openshift/openshift-ansible/tree/master/playbooks/openshift-glusterfs


