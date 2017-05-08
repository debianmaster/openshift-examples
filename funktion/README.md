```sh
https://github.com/funktionio/funktion/releases
chmod +x ~/Downloads/funktion-darwin-amd64
mv ~/Downloads/funktion-darwin-amd64 /usr/local/bin/funktion
funktion install platform
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:funktion-system:exposecontroller
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:default:exposecontroller
```


### Pros
1) Native #need to verify

### Cons
1) More like microservices, seems to maintain one pod per function which always runs (not just when its needed)
