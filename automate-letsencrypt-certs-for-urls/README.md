
# New project here.  works better https://github.com/tnozicka/openshift-acme

> Taken from  https://github.com/ibotty/openshift-letsencrypt  and all credit of this work goes to @ibotty
> This is a TL;DR version of automating provisioning of certs from letsencrypt.

### Generate dehydrate account-key
```sh
$ oc new-project letsencrypt
$ git clone https://github.com/lukas2511/dehydrated.git
$ cd dehydrated
$ ./dehydrated --register --accept-terms

$ ls accounts/
aHR0cHM6Ly9hYL2RpcmVjdG9yeQo

$ ls accounts/aHR0cHM6Ly9hYL2RpcmVjdG9yeQo/
account_key.pem		registration_info.json

$ oc secrets new letsencrypt-creds account-key=accounts/aHR0cHM6Ly9hYL2RpcmVjdG9yeQo/account_key.pem
```

### Deploy automatic certs provider controller
```sh
oc create -f https://raw.githubusercontent.com/ibotty/openshift-letsencrypt/master/template.yaml
oc new-app --template=letsencrypt -p LETSENCRYPT_CONTACT_EMAIL=name@example.com
oc policy add-role-to-user edit -z letsencrypt
```

### Deploy sample app 
```sh
oc new-app debianmaster/go-welcome --name=welcome
oc expose svc welcome 
```

### Apply certs
```sh
oc label route welcome butter.sh/letsencrypt-managed=yes
```

### Go check your green route !!
