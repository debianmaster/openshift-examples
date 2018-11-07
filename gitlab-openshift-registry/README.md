
## Using gitlab registry as openshift external registry

> Looks like creating single secret pointing to `registry.gitlab.com` is not enough for gitlab registry auth  you need to create two secrets
> one pointing to  registry.gitlab.com and another pointing to gitlab.com


```sh
kubectl create secret docker-registry gitlab-registry \
  --docker-server=registry.gitlab.com \
  --docker-username=$DOCKER_USER \
  --docker-password=$DOCKER_PASSWORD \
  --docker-email=$DOCKER_EMAIL
  ```
  
> AND

```sh
kubectl create secret docker-registry gitlab-registry \
  --docker-server=gitlab.com \
  --docker-username=$DOCKER_USER \
  --docker-password=$DOCKER_PASSWORD \
  --docker-email=$DOCKER_EMAIL
```  
