

# WIP

```sh
wget https://github.com/operator-framework/operator-sdk/releases/download/v0.1.0/operator-sdk-v0.1.0-x86_64-apple-darwin
mv operator-sdk-v0.1.0-x86_64-apple-darwin /usr/local/bin/odk
chmod +x /usr/local/bin/odk
````

```sh
odk new odoo-operator --type=ansible --kind=Odoo --api-version=odoo.test.io/v1alpha1
cd odoo-operator
oc apply -f deploy/crd.yaml
```
> replace `/opt/ansible/roles/Odoo`  with ` /Users/jjonagam/odk/odoo-operator/roles/Odoo`  in watches.yml    
> update following file `roles/Odoo/tasks/main.yml`

```yml
---
- name: start Odoo
  k8s:
    definition:
      apiVersion: extensions/v1beta1
      kind: Deployment
      metadata:
        creationTimestamp: null
        labels:
          run: web
        name: web
      spec:
        replicas: 1
        selector:
          matchLabels:
            run: web
        strategy: {}
        template:
          metadata:
            creationTimestamp: null
            labels:
              run: web
          spec:
            containers:
            - env:
              - name: DB_ENV_POSTGRES_USER
                value: odoo
              image: odoo:12
              name: web
              resources: {}
      status: {}
```



```sh
odk up local -n odk
oc apply -f deploy/cr.yaml
```

