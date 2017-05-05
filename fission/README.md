```sh
git clone https://github.com/fission/fission.git
cd fission
oc create -f http://fission.io/fission.yaml
oc adm policy add-scc-to-user anyuid -z default -n fission
oc adm policy add-scc-to-user anyuid -z default -n fission-function
oc adm policy add-scc-to-user privileged -z default -n fission
oc adm policy add-scc-to-user privileged -z default -n fission-function
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:fission:default  -n fission
export FISSION_ROUTER=http://router-fission.192.168.51.120.xip.io
export FISSION_URL=http://controller-fission.192.168.51.120.xip.io
curl http://fission.io/mac/fission > fission && chmod +x fission && sudo mv fission /usr/local/bin/
fission env create --name nodejs --image fission/node-env
curl https://raw.githubusercontent.com/fission/fission/master/examples/nodejs/hello.js > hello.js
fission function create --name hello --env nodejs --code hello.js
fission route create --method GET --url /hello --function hello
curl http://$FISSION_ROUTER/hello
```
