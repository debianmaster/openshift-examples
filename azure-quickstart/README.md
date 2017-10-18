```sh
az group create -n ocp-rg -l 'West US'
az keyvault create -n ocp-kv -g ocprg -l 'West US' --enabled-for-template-deployment true
az keyvault secret set --vault-name ocpkv -n ocp-kv-secret --file ~/.ssh/id_rsa
az group deployment create \
--name OCPDeployment \
--resource-group ocprg \
--template-uri "https://gallery.azure.com/artifact/20161101/redhat.openshift-container-platformocp.1.0.3/Artifacts/mainTemplate.json" \
--parameters @params.json
```
