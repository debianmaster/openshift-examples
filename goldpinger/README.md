# OCP
```sh
wget https://gist.githubusercontent.com/debianmaster/e57e52f2c126e09ca66554fd27b2b34e/raw/215bb02a15ad5ad10626de0183bc0238eb82ce3e/gistfile1.txt
mv gistfile1.txt goldpinger.yaml
oc new-project lab
oc adm policy add-scc-to-user anyuid -z default
oc adm policy add-role-to-user admin -z default -n lab
oc apply -f goldpinger.yaml
oc delete po -l app=goldpinger
oc expose svc goldpinger
```

# k8s
```sh
wget https://gist.githubusercontent.com/debianmaster/e57e52f2c126e09ca66554fd27b2b34e/raw/215bb02a15ad5ad10626de0183bc0238eb82ce3e/gistfile1.txt
mv gistfile1.txt goldpinger.yaml
kubectl create ns lab
kubectl apply -f goldpinger.yaml -n lab
```
