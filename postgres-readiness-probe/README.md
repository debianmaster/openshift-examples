> works only for bitnami image

```sh
sh -c PGPASSWORD=${POSTGRES_PASSWORD} /opt/bitnami/postgresql/bin/psql -w -U ${POSTGRES_USER} -d {POSTGRESQL_DATABASE} -c 'SELECT 1'
```
