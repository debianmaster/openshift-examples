## Simple setup
```sh
oc adm policy add-scc-to-user anyuid -z default
oc new-app jboss/keycloak --name=auth -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=password
oc expose svc/keycloak
```

## setup keycloak
> in keycloak pod

```sh

./kcadm.sh config credentials     --server http://localhost:8080/auth     --realm master     --user adm --password mypass
./kcadm.sh create realms -s realm=origin-login -s enabled=true -s displayName="origin-login"

wget https://gist.githubusercontent.com/debianmaster/860b022b262dd7d38adf92a6ad35b678/raw/12a0b438418c6ba12012f99d4cab1a08de914aa0/client.json 

./kcadm.sh create clients -f client.json -r origin-login -s secret=mypass -s clientId=origin-login -H
```


## Via Ansible
```sh
openshift_master_identity_providers=[{'name': 'htpasswd_auth', 'login': 'true', 'challenge': 'true', 'kind': 'HTPasswdPasswordIdentityProvider', 'filename': '/etc/origin/htpasswd'},{'name': 'YOUR-OAuth', 'login': 'true', 'challenge': 'false', 'mappingMethod': 'claim', 'kind': 'OpenIDIdentityProvider','clientID': 'openshift-001','clientSecret': '<THE-PASSWORD>', 'claims':{'id':['sub'],'preferredUsername':['preferred_username'],'name':['name'],'email':['email']},'urls':{'authorize':'https://secure-sso<your-domain>/auth/realms/MY-REALM/protocol/openid-connect/auth','token': 'https://secure-sso<your-domain>/auth/realms/MY-REALM/protocol/openid-connect/token','userInfo':'https://secure-sso<your-domain>/auth/realms/MY-REALM/protocol/openid-connect/userinfo'}}]
```


## Keycloak for openshift auth

```yaml
oauthConfig:
  alwaysShowProviderSelection: false
  assetPublicURL: https://cloud.expertsfactory.com/console/
  grantConfig:
    method: auto
    serviceAccountMethod: prompt
  identityProviders:
  - name: my_openid_connect
    challenge: true
    login: true
    mappingMethod: claim
    provider:
      apiVersion: v1
      kind: OpenIDIdentityProvider
      clientID: expertsfactory
      clientSecret: 2eb9c428-dummy-dummy-0dd569eca8ec
      claims:
        id:
        - sub
        preferredUsername:
        - preferred_username
        name:
        - name
        email:
        - email
      urls:
        authorize: https://auth.cloud.expertsfactory.com/auth/realms/expertsfactory/protocol/openid-connect/auth
        token: https://auth.cloud.expertsfactory.com/auth/realms/expertsfactory/protocol/openid-connect/token
```
