## Simple setup
```sh
oc cluster up 
oc adm policy add-scc-to-user anyuid -z default
oc new-app jboss/keycloak --name=auth -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=password
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
