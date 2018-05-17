## Install apb cli on mac
```sh
git clone https://github.com/fusor/ansible-playbook-bundle.git
cd ansible-playbook-bundle && sudo pip install -U setuptools && sudo pip install -r src/requirements.txt && python setup.py install
```

```
oc cluster up --service-catalog
```

```
oc new-project ansible-service-broker
oc create -n ansible-service-broker -f https://raw.githubusercontent.com/openshift/ansible-service-broker/ansible-service-broker-1.2.12-1/templates/deploy-ansible-service-broker.template.yaml
oc create -n ansible-service-broker -f https://raw.githubusercontent.com/ansibleplaybookbundle/ansible-playbook-bundle/apb-1.2.8-1//templates/openshift-permissions.template.yaml

```


```
export BROKER_REPO_TAG=ansible-service-broker-1.2.12-1
export APBTOOLS_REPO_TAG=apb-1.2.8-1
export  DOCKERHUB_ORG=ansibleplaybookbundle
oc process ansible-service-broker -n ansible-service-broker -p BROKER_IMAGE=ansibleplaybookbundle/origin-ansible-service-broker:${BROKER_REPO_TAG} -p DOCKERHUB_ORG=${DOCKERHUB_ORG} -p ROUTING_SUFFIX=${routing-suffix} -p BROKER_CA_CERT=$(oc get secret -n kube-service-catalog -o go-template=\'{{ range .items }}{{ if eq .type \"kubernetes.io/service-account-token\" }}{{ index .data \"service-ca.crt\" }}{{end}}{{\"\\n\"}}{{end}}\' | tail -n 1) | oc apply  -n ansible-service-broker -f-
oc process apbtools-permission -n ansible-service-broker | oc apply  -f-
```




