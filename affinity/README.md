## PodAffinity & PodAntiAffinity 

> Pod affinity and pod anti-affinity allow you to specify rules about how pods should be placed relative to other pods

```sh
oc get nodes -o wide --show-labels=true
oc get pods --show-labels=true
```
> Paste this inside `spec`  or `annotations` 
```yaml
spec:
  template:
    spec:
      affinity:
        podAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
          - labelSelector:
              matchExpressions:
              - key: app
                operator: In
                values:
                - database
            topologyKey: "kubernetes.io/hostname"
```      
```sh
kubectl patch deployment orders --patch "$(cat affinity.yaml)"
```

```yaml
  affinity:
    podAntiAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
      - labelSelector:
          matchExpressions:
          - key: security
            operator: In
            values:
            - S2
        topologyKey: kubernetes.io/hostname
```        
