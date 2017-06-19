```sh
export POD=$(oc get pods -l app=store -o jsonpath={.items[0].metadata.name})
oc rsync ./ $POD:/opt/app-root/src --exclude="node_modules/*",".git/*" --no-perms=true --progress=true -w
```
