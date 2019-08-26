```sh
helm list
> gc every 3 hours
oc new-project operations
helm install --name garbage-collector  stable/spotify-docker-gc --set cron.schedule="0 */3 * * *"
oc adm policy add-scc-to-user privileged -z default
```
