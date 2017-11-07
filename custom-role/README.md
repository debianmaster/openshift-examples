```yaml
apiVersion: v1
kind: ClusterRole
metadata:
  creationTimestamp: null
  name: edit_without_rsh (1)
rules:
- apiGroups:
  - ""
  attributeRestrictions: null
  resources:
  - pods
  - pods/attach
  - pods/exec
  - pods/portforward
  - pods/proxy
  verbs:
  - create
  - delete
  - deletecollection
  - get
  - list
  - patch
  - update
  - watch
```
