```sh
skopeo copy docker://localhost:5000/myrhel7 dir:/root/test/
skopeo layers docker://localhost:5000/myrhel7
skopeo inspect docker://docker.io/library/mariadb
skopeo copy --src-creds stage_user:stage_pass docker://internal.registry/myimage:latest  --dest-creds prod_user:prod_pass
docker://production.registry/myimage:v1.0
```
