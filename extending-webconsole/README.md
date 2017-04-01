> You can fully customize and run openshift webconsole seperately    

###  On server  
```sh
oc cluster up 
oc login -u system:admin
oc patch oauthclient/openshift-web-console -p '{"redirectURIs":["https://localhost:9000/"]}'
```



### On Web console
```sh
git clone https://github.com/openshift/origin-web-console
cd origin-web-console
bower install 
npm install
grunt serve
```
