```
oc new-app dpage/pgadmin4 -e -e "PGADMIN_DEFAULT_EMAIL=user@domain.com"  -e "PGADMIN_DEFAULT_PASSWORD=SuperSecret"

oc expose svc pgadmin4
```
