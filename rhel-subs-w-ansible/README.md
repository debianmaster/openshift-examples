```console
ansible all -m shell -a "echo 1"
ansible all -m shell -a "subscription-manager register   --username=username --password=passcode"
ansible all -m shell -a 'subscription-manager repos --disable="*"'
ansible all -m shell -a "subscription-manager attach --pool=8a85f9815aa2b838015aa2be0bd30773"
ansible all -m shell -a 'subscription-manager repos     --enable="rhel-7-server-rpms"     --enable="rhel-7-server-extras-rpms"'
ansible all -m shell -a "yum install ceph-common -y"
ansible all -m shell -a "subscription-manager unregister"
```
