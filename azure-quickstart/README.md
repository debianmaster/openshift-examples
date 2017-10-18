```sh
az group create -n ocprg -l 'West US'
az keyvault create -n ocpkv -g ocprg -l 'West US' --enabled-for-template-deployment true
az keyvault secret set --vault-name ocpkv -n ocpkvsecret --file ~/.ssh/id_rsa
az group deployment create     --name OCPDeployment     --resource-group ocprg     --template-uri "https://gallery.azure.com/artifact/20161101/redhat.openshift-container-platformocp.1.0.3/Artifacts/mainTemplate.json"     --parameters @params.json
```
