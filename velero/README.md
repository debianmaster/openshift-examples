## openshift 4.x
```sh
git clone https://github.com/heptio/velero.git
cd velero
k create ns velero
k apply -f examples/minio/00-minio-deployment.yaml -n velero
oc create route edge my-route --service=frontend --hostname='minio-velero.apps.example'
```

## create minio crendentials file

```sh
cat ~/.credentials-velero
[default]
aws_access_key_id = 'minio'
aws_secret_access_key = 'minio123'
```


## openshift 4 & openshift 3.11  
```sh
velero install \
    --provider aws \
    --bucket velero \
    --use-restic \
    --secret-file ~/.credentials-velero \
    --use-volume-snapshots=true \
    --backup-location-config region=velero \
    --snapshot-location-config region=velero \
    --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=http://minio-velero.apps.example
```
> all worker nodes
```
senenforce 0
```

## openshift 3.11  
```sh
oc adm policy add-scc-to-user privileged -z velero -n velero
```
```
           hostPath:
-            path: /var/lib/kubelet/pods
+            path: /var/lib/origin/openshift.local.volumes/pods
           securityContext:
+            privileged: true
```
> if you need pv backup
```sh
kubectl -n YOUR_POD_NAMESPACE annotate pod/YOUR_POD_NAME backup.velero.io/backup-volumes=YOUR_VOLUME_NAME_1,YOUR_VOLUME_NAME_2,...
```

```sh
velero backup create veltest-1 --include-namespaces veltest --exclude-resources='storageclasses.storage.k8s.io,replicasets.apps,replicasets.extensions'  --snapshot-volumes=true
```

> wait for sync to happen

## openshift 4
```sh
velero restore create --from-backup veltest-1
```

