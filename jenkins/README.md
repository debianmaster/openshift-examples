### Install additional plugins 
```sh
oc cp plugins.txt jenkins-1-881d1:/tmp/plugins.txt
oc rsh jenkins-1-881d1 /usr/local/bin/install-plugins.sh /tmp/plugins.txt
```
