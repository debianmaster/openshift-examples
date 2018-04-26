```sh
ansible all -m shell -a "sudo subscription-manager refresh"
ansible all -m shell -a 'sudo subscription-manager repos --disable="rhel-7-server-ose-3.7-rpms" --enable="rhel-7-server-ose-3.8-rpms" --enable="rhel-7-server-ose-3.9-rpms" --enable="rhel-7-server-extras-rpms" --enable="rhel-7-server-ansible-2.4-rpms" --enable="rhel-7-fast-datapath-rpms"'

