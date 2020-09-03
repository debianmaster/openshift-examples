```
wget https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-mac.zip
unzip and move the oc /usr/local/bin
```


```
export KUBECONFIG=~/Downloads/shikha.yaml
export DIGITALOCEAN_ACCESS_TOKEN=<key>
```


```
oc create sa customsa -n kube-system
oc adm policy add-cluster-role-to-user cluster-admin -z customsa -n kube-system
oc -n kube-system sa create-kubeconfig customsa > ~/.kube/shikha.sa.yaml
```
