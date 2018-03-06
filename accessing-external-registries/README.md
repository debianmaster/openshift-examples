## Importing External Images

#### Approach 1
```sh
oc import-image --from=externalregistry-image imagename  --all --confirm --insecure=true 
#This will import image as image stream, but if you want to import any latest changes you need to 
oc import-image imagename  --all --confirm --insecure=true
EX- 
oc import-image --from=docker-registry-default.cloud.expertsfactory.com/lab/gotest --all --insecure=true gotest -n myproject  --confirm
```

#### Approach 2 
```sh
oc tag externalregistry-image:latest myproject/myimage:latest --scheduled=true --insecure=true  --source=docker 
#This will periodically (once in ~15 min) for new images and then deploy newer versions
Ex:- 
oc tag --source=docker docker-registry-default.cloud.expertsfactory.com/lab/gotest:latest myproject/gotest-new:latest --scheduled=true --insecure=true

```

Note:-  you need to add exceptions to docker-daemon  in case of insecure external registries

#### refreshing deployed image (external registry)
```sh
oc import-image debianmaster/test --confirm
```
