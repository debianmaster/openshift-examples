## Allow anyuid
```sh
oc adm policy add-scc-to-user anyuid -z default
```

## Deploy statefulset
```sh
oc apply -f https://raw.githubusercontent.com/cockroachdb/cockroach/master/cloud/kubernetes/cockroachdb-statefulset.yaml
```

## Init cluster
```sh
oc apply -f https://raw.githubusercontent.com/cockroachdb/cockroach/master/cloud/kubernetes/cluster-init.yaml
```

## Expose UI 

```sh
oc expose svc  cockroachdb-public --port=8080 --name=r1
```

## Scale statefulset
```sh
oc scale statefulset cockroachdb --replicas=4
```

###  Connect to cluster
```sh
oc run cockroachdb -it --image=cockroachdb/cockroach --rm --restart=Never     -- sql --insecure --host=cockroachdb-public
```
```sh
create database store;
use store;
create table inventory (id int,product_id varchar(30),product_cost int,product_availabilty int,product_subcat int);
insert into inventory values (1,'cable_1',10,200,1);
```

### Example app
```sh
oc new-app debianmaster/store-inventory:cockroach --name=inventory \
-e sql_string=postgresql://root@cockroachdb-public:26257/store?sslmode=disable
oc expose svc inventory
```
