```yaml
admissionConfig:
  pluginConfig:
    ProjectRequestLimit:
      configuration:
        apiVersion: v1
        kind: ProjectRequestLimitConfig
        limits:
        - selector:
            level: admin (1)
        - selector:
            level: advanced (2)
          maxProjects: 10
        - maxProjects: 2 (3)
```
