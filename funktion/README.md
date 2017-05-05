```sh
https://github.com/funktionio/funktion/releases
chmod +x ~/Downloads/funktion-darwin-amd64
mv ~/Downloads/funktion-darwin-amd64 /usr/local/bin/funktion
funktion install platform
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:funktion-system:exposecontroller
```
