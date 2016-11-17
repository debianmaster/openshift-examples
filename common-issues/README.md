## Cli connectivity issues
#### Proxy 
```sh
set https_proxy=https://username:password@proxy:8080
set http_proxy=http://username:password@proxy:8080
```

#### cert issue
```sh
   oc login --insecure-skip-tls-verify=true  https://ocp.ck.osecloud.com:8443 
```
