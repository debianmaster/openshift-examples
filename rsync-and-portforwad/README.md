```sh
oc rsync ./ store-8-kp5j1:/opt/app-root/src --exclude=["node_modules/*",".git/*"]
```
