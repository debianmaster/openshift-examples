```sh
az group create -n ocprg -l 'West US'
az keyvault create -n ocpkv -g ocprg -l 'West US' --enabled-for-template-deployment true
az keyvault secret set --vault-name kpocpkv -n kpocpkv-secret --file ~/.ssh/id_rsa
```
