> If you want to automate registry pull and push activities from ci/cd process.

## One time activity 
```sh
oc create serviceaccount registry-bot
oc adm policy add-cluster-role-to-user cluster-admin registry-bot
oc sa get-token registry-bot
```
 
## Automate push / pull
```sh
export TOKEN=$(oc sa get-token registry-bot)
docker login <openshift-registry-url> -u registry-bot -p $TOKEN
docker push <yourimage>
```


> Optional 
#### Extract reigistry URL  
```sh
oc get routes docker-registry -n default
export DOCEKR_REGISTRY=$(oc get routes docker-registry -n default --no-headers=true -o=custom-columns=NAME:.spec.host)
```
