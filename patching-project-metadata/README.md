credits to @ablock

> To patch a project annotation you would need to add the ability to patch a namespace. Take a look at the following ClusterRole that enables that functionality
> The majority of project fields are immutable. The preferred method is to update the namespace and the changes are bubbled up to the project object

```yaml
- apiVersion: v1
  kind: ClusterRole
  metadata:
    annotations:
      openshift.io/description: Associated to users patching namespaces
    name: namespace-patcher
  rules:
  - apiGroups:
    - ""
    attributeRestrictions: null
    resources:
    - namespaces
    verbs:
    - patch
```
OR

```
oc create clusterrole project-annotator --verb=patch --resource=namespaces
```

> now you can do

```
oc annotate namespace <targetns> openshift.io/requester=some-otherowner --overwrite
```
