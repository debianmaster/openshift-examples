> First create route with passthrough and get destination CA and store cert part from result as   destination-ca.crt

```sh
echo | openssl s_client -servername secure-auth-erp.apps.example.io -connect secure-auth-erp.apps.example.io:443 2>/dev/null |     openssl x509 -text
```

> delete original passthrough route
```sh
oc delete route <current_passthroug_route>
```

> Create reencrypt with destination ca

```sh
oc create route reencrypt keycloak-auth --service=secure-auth --hostname=auth.example.io -n erp --ca-cert='/etc/cloud.example.io/certs/wildcard.example.io/*.example.io/*.example.io.cer' --cert='/etc/cloud.example.io/certs/wildcard.example.io/*.example.io/fullchain.cer' --key='/etc/cloud.example.io/certs/wildcard.example.io/*.example.io/*.example.io.key'
```

> Goto route in GUI and add  destination-ca.crt content in route and save
