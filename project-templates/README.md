```sh
oc adm create-bootstrap-project-template -o yaml > template.yaml
oc create -f template.yaml -n default

projectConfig:
  projectRequestTemplate: "default/project-request"
```

> Disable self provisioning

`oc adm policy remove-cluster-role-from-group self-provisioner system:authenticated system:authenticated:oauth`

https://docs.openshift.org/latest/admin_guide/managing_projects.html#overview
