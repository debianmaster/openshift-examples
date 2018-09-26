```sh
sudo -i
yum install docker -y
yum restart docker
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
ssh-copy-id root@localhost 
#or vi /root/.ssh/authorized_keys   add to authorized keys
export VM_IP=139.11.8.21
minishift start --vm-driver=generic --remote-ipaddress=$VM_IP --remote-ssh-user=root --remote-ssh-key=/root/.ssh/id_rsa
```
