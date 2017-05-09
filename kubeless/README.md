
## Serverless 

```sh
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:kubeless:default
#Install kubeless from https://github.com/bitnami/kubeless/releases 
kubeless install
oc adm policy add-scc-to-user anyuid -z default -n kubeless
```
> Create test.py    

```python
def foobar(context):
   print context.json
   return context.json
```  

```sh
kubeless function deploy get-python --runtime python27 --handler test.foobar --from-file test.py --trigger-http
kubectl get functions -n default
kubeless function call get-python --data '{"echo": "echo echo"}'
```


### UI

```sh
git clone https://github.com/bitnami/kubeless-ui.git
cd kubeless-ui
docker built -t "kubeless-ui" .
docker tag kubeless-ui debianmaster/kubeless-ui
docker push debianmaster/kubeless-ui
oc new-app docker.io/debianmaster/kubeless-ui  -n kubeless
```
