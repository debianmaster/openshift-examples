#### Git Auth provider
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
 
