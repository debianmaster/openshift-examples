## Importing External Images

#### Approach 1
```sh
oc import-image --from=externalregistry-image imagename  --all --confirm --insecure=true #This will import image as image stream, but if you want to import any latest changes you need to 
oc import-image imagename  --all --confirm --insecure=true
```

#### Approach 2 
```sh
oc tag externalregistry-image:latest myproject/myimage:latest --scheduled=true --insecure=true  --source=docker 
```
This will periodically (once in ~15 min) for new images and then deploy newer versions
