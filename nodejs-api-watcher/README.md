```sh
export K8S_HOST='127.0.0.1'
export K8S_PORT=8443
export K8S_SECRET=$(oc whoami -t)
node watch.js
```   
