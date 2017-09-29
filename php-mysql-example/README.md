### Deploy MYSQL
```sh
oc new-app mysql MYSQL_USER=user MYSQL_PASSWORD=pass MYSQL_DATABASE=testdb -l db=mysql
```

### Deploy php application and link with MYSQL
```
oc new-app https://github.com/gshipley/phpdatabase MYSQL_SERVICE_HOST=mysql MYSQL_USER=user MYSQL_PASSWORD=pass MYSQL_DATABASE=testdb
```


### Expose php app
```
oc expose svc phpdatabase
```
