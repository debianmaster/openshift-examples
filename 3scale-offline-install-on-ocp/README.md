> Do this activity from a laptop which has access to internet  and also openshift.

## Syncing images to openshift
```sh
oc create project my-proj
wget https://raw.githubusercontent.com/3scale/3scale-amp-openshift-templates/master/amp/amp.yml 
oc create project rhscl
oc create project 3scale-amp22
oc project my-proj
export rh_reg=registry.access.redhat.com
export my_reg=docker-registry-default.apps.sgp109.openshiftworkshop.com
cat amp.yml | grep -A1  DockerImage | grep name |  sed 's/        name://g' | xargs -n 1 docker pull
cat amp.yml| grep -A1  DockerImage | grep name |  sed 's/        name: registry.access.redhat.com//g' | xargs -I '{}' docker tag  $rh_reg'{}' $my_reg'{}'
cat amp.yml | grep -A1  DockerImage | grep name |  sed 's/        name: registry.access.redhat.com//g' | xargs -I '{}' docker push $my_reg'{}'
cat amp.yml | grep -A1  DockerImage | grep name |  sed 's/        name://g' | xargs -I '{}' echo registry.access.redhat.com/3scale-amp2'{}'  '{}'
```

## Deploying 3scale
```sh
export reg_ip=$(oc get svc docker-registry -n default --no-headers | awk '{ print $3}')
cat amp.yml  | sed 's/registry.access.redhat.com/'"$reg_ip"':5000/g'  | oc apply -f-
```
