## Disable UI
### Inventory file
```yaml
osm_disabled_features=["WebConsole"]
```
### Disable UI,Builds,s2i
```yaml
osm_disabled_features=["Builder", "S2IBuilder", "WebConsole"]
```

OR 

### In master-config
```yaml
disabledFeatures:
 - WebConsole
```
