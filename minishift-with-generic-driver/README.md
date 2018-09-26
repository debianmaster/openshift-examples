## Run everything as root
```sh
sudo -i
```

## Clean up old
```sh
rm -rf /root/.minishift
```

## if you are living in dark ages
```sh
yum-config-manager --enable rhel-7-server-extras-rpms
```

## install / start docker
```sh
yum install docker -y
yum restart docker
```

## Generate id_rsa.pub and add it to authorized_keys
```sh
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
ssh-copy-id root@localhost 
#or vi /root/.ssh/authorized_keys   add to authorized keys
```

## Start minishift with generic vm driver
```
export VM_IP=139.11.8.21
minishift start --vm-driver=generic --remote-ipaddress=$VM_IP --remote-ssh-user=root --remote-ssh-key=/root/.ssh/id_rsa
```
