```json
{
    "kind": "Service",
    "apiVersion": "v1",
    "metadata": {
        "name": "my-service",
        "namespace": "prod"
    },
    "spec": {
        "type": "ExternalName",
        "externalName": "my.database.example.com"
    }
}
```
