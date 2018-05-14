# WIP dont use
### UI

```sh
 cd ~/
 git clone https://github.com/openshift/origin-web-console.git

 cd ~/
 git clone https://github.com/openshift/origin-web-common.git

 cd ~/
 git clone https://github.com/openshift/origin-web-catalog.git


 cd ~/origin-web-common
 bower link
 cd ~/origin-web-catalog
 bower link
 cd ~/origin-web-console
 bower link origin-web-common
 bower link origin-web-catalog
 
 
 oc cluster up # make sure origin is running on 127.0.0.1:8443
 grunt serve
 ```
 
 ### Build on MAC
 ```sh
 
 ```
