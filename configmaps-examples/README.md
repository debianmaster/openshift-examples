```sh
oc new-app debianmaster/go-welcome

cat > config.json <<EOF
{
  "username":"admin",
  "password":"password",
  "host":"mymysqhost"
}
EOF

oc create configmap mysql-config --from-file=./config.json
oc volume dc/go-welcome --add --name=mysqlcfg -m /tmp/mysqlconfig -t configmap --configmap-name=mysql-config  
oc get pods 
oc rsh <go-welcome-podname>
cat /tmp/mysqlconfig/config.json  #inside the pod
```
