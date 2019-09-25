```sh
platform@Azure:~$ ACR_NAME=capedev
platform@Azure:~$ SERVICE_PRINCIPAL_NAME=capedev-acr
platform@Azure:~$ ACR_REGISTRY_ID=$(az acr show --name $ACR_NAME --query id --output tsv)
platform@Azure:~$ SP_PASSWD=$(az ad sp create-for-rbac --name http://$SERVICE_PRINCIPAL_NAME --scopes $ACR_REGISTRY_ID --role acrpull --query password --output tsv)
platform@Azure:~$ SP_APP_ID=$(az ad sp show --id http://$SERVICE_PRINCIPAL_NAME --query appId --output tsv)
```
