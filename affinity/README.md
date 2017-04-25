```yaml
    scheduler.alpha.kubernetes.io/affinity: |
      {
        "podAntiAffinity": {
          "requiredDuringSchedulingIgnoredDuringExecution": [{
            "labelSelector": {
              "matchExpressions": [{
                "key": "docker-registry",
                "operator": "In",
                "values":["default"]
              }]
            },
            "topologyKey": "kubernetes.io/hostname"
          }]
        }
      }
```      
