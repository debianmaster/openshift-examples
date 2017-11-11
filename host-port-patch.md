```
kubectl patch deployment welcome -p='[{"op": "replace", "path": "/spec/containers/0/ports", "value":
[{
         "containerPort": 80,
         "hostPort": 80,
         "protocol": "TCP"
      },
      {
         "containerPort": 443,
         "hostPort": 443,
         "protocol": "TCP"
      }
   ]}]'
```

```
kubectl patch deployment welcome -p='[{"op": "replace", "path": "/spec/containers/0/ports", "value":"[{\"containerPort\":\"80\",\"hostPort\": \"80\",\"protocol\": \"TCP\"},{\"containerPort\": \"443\",\"hostPort\": \"4443\",\"protocol\": \"TCP\"}]"}]'
```
