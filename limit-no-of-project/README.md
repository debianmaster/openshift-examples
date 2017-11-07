### If inventory
```
#openshift_master_admission_plugin_config={"ProjectRequestLimit":{"configuration":{"apiVersion":"v1","kind":"ProjectRequestLimitConfig","limits":[{"selector":{"admin":"true"}},{"maxProjects":"1"}]}},"PodNodeConstraints":{"configuration":{"apiVersion":"v1","kind":"PodNodeConstraintsConfig"}}}
```


### Edit master
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
