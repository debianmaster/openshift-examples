 ## If hosts are not registered
 ```
 ansible all -m shell -a 'subscription-manager register --username=myuser --password=mypass'
 ansible all -m shell -a 'subscription-manager attach --pool=pool015aa2be0bd30773'
 ansible all -m shell -a 'subscription-manager repos --disable="*"'
 ansible all -m shell -a 'subscription-manager repos --enable="rhel-7-server-rpms" --enable="rhel-7-server-extras-rpms" --enable="rhel-7-server-ose-3.6-rpms" --enable="rhel-7-fast-datapath-rpms"'
 ansible all -m shell -a 'yum install wget git net-tools bind-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct -y'
 ```

 
 ## Update repos
 ```
 ansible all -m shell -a 'yum update -y'
 ```
 
