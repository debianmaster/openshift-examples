> For DC
```sh
oc get nodes --show-labels=true
oc patch dc/<dcname> -p '{"spec":{"template":{"spec":{"nodeSelector":{"<label_name>":"<label_value>"}}}}}'
```


>  For Project
credit  to veermuchandi

OpenShift administrator sets the node selector for a specific project by editing the project namespace. As an example to edit namespace for a project named “new project”
```
# oc edit namespace newproject
```
Find the annotations section and add a node selector annotation as under. This is a yaml file; so make sure that the indentation is right.
```yaml
  annotations:
    openshift.io/node-selector: “region=secondary"
    openshift.io/description: ""
    openshift.io/display-name: ""
```
> For Project
```sh
oc annotate ns <target-proj> openshift.io/node-selector='kubernetes.io/hostname=app1.ap.ex.io'
```


```
kubectl -n ingress-nginx  patch deployments ingress-nginx-controller -p '{"spec": {"template": {"spec": {"nodeSelector": {"node-role.kubernetes.io/master": "true"}}}}}'
```
