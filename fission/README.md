```sh
oc login -u system:admin  ##run as cluster admin 
git clone https://github.com/fission/fission.git
cd fission
oc create -f http://fission.io/fission.yaml
oc adm policy add-scc-to-user anyuid -z default -n fission
oc adm policy add-scc-to-user anyuid -z default -n fission-function
oc adm policy add-scc-to-user privileged -z default -n fission
oc adm policy add-scc-to-user privileged -z default -n fission-function
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:fission:default  -n fission


oc create -f http://fission.io/fission-nodeport.yaml
oc expose svc controller --port=8888 -n fission
oc expose svc router --port=8888 -n fission
export FISSION_ROUTER=$(oc get routes -n fission | grep router-fission | awk '{print $2}')
export FISSION_URL=$(oc get routes -n fission | grep controller-fission | awk '{print $2}')
curl http://fission.io/mac/fission > fission && chmod +x fission && sudo mv fission /usr/local/bin/
fission env create --name nodejs --image fission/node-env
curl https://raw.githubusercontent.com/fission/fission/master/examples/nodejs/hello.js > hello.js
fission function create --name hello --env nodejs --code hello.js
fission route create --method GET --url /hello --function hello
curl http://$FISSION_ROUTER/hello
```

### Pros
1) Fast starts, Maintains pool of containers
2) Scales up and down #need to verify more

### Cons
1) No available connectors to databases / social / message que etc


