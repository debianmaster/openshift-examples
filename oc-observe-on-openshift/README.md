> Note:  not tested 

## Poor (Wo)man's operator  `oc observe` on openshift
```sh
oc new-app https://github.com/rackerlabs/s2i-oc-observe --name=observe --build-env=OPENSHIFT_CLIENT_VERSION=v3.11.0,OPENSHIFT_CLIENT_HASH=0cbc58b
```


```sh
oc set env dc/observe RESOURCE=ns  OBSERVE_ARGS="" SCRIPT_PATH="/tmp/observe.sh"
```


