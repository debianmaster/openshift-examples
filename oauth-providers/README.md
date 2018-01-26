### Htpasswd Auth providers
> Openshift vars
```sh
openshift_master_identity_providers=[{'name': 'htpasswd_auth', 'login': 'true', 'challenge': 'true', 'kind': 'HTPasswdPasswordIdentityProvider', 'filename': '/etc/origin/master/htpasswd'}]
```
> master-config

```yaml
oauthConfig:
  ...
  identityProviders:
  - name: my_htpasswd_provider 
    challenge: true 
    login: true 
    mappingMethod: claim 
    provider:
      apiVersion: v1
      kind: HTPasswdPasswordIdentityProvider
      file: /path/to/users.htpasswd 
```


### Git Auth provider
> In master-config.yml    

```yml
  identityProviders:
  - challenge: false
    login: true
    name: git
    provider:
      apiVersion: v1
      kind: GitHubIdentityProvider
      clientID: ad0a9bxxxxxxxx9a40ca
      clientSecret: 70b7985xxxxxxx3e97293bb7479993
 ```     
 
 > In github.com 
 
 Developer Settings -> Oauth Applications -> Register New application
 
 ```sh
 Homepage URL: https://127.0.0.1:8443   ##assuming your master URL
 Authorization callback URL:  https://127.0.0.1:8443/oauth2callback/git
 ```
 
 Note:  make sure  your identity provider name matches in callback url w.r.t identity provider name
 

### Keycloak Provider or OpenId Provider
> In master-config.yml  

```yml
  identityProviders:
  - name: my_openid_connect 
    challenge: true 
    login: true 
    mappingMethod: claim 
    provider:
      apiVersion: v1
      kind: OpenIDIdentityProvider
      clientID: chakra 
      clientSecret: a9ab2ca2-xxxx-yyyy-cccc-b18499f93b8a 
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
        authorize: https://auth.cloud.expertsfactory.com/auth/realms/mymac/protocol/openid-connect/auth         
        token: https://auth.cloud.expertsfactory.com/auth/realms/mymac/protocol/openid-connect/token
```
> In Keycloak     
```sh
Add new Realm (Ex:- chakra) ->  Select Realm  
Realm Settings -> General tab -> Provide name   -> Save
Realm Settings -> Clients -> Create -> Provide name for Client Id -> Client protocol = openid-connect  -> Save
Realm Settings -> Clients -> select created client -> Settings tab-> Access Type = Confidential ->  Valid Redirect =  https://127.0.0.1:8443/oauth2callback/my_openid_connect/*  -> Save  
Realm Settings -> Clients -> select created client -> Credentials tab -> copy client secret. 
```


