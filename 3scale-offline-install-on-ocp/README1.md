```
export rh_reg=registry.access.redhat.com
export my_reg=docker-registry-default.13.251.251.251.nip.io


oc new-project my-proj
wget https://raw.githubusercontent.com/3scale/3scale-amp-openshift-templates/master/amp/amp.yml 
oc new-project  rhscl
oc new-project  3scale-amp22
oc project my-proj
oc policy add-role-to-user system:image-puller system:serviceaccount:my-proj:default -n 3scale-amp22
oc policy add-role-to-user system:image-puller system:serviceaccount:my-proj:default -n rhcsl



cat amp.yml | grep -A1  DockerImage | grep name |  sed 's/        name://g' | xargs -n 1 docker pull
cat amp.yml| grep -A1  DockerImage | grep name |  sed 's/        name: registry.access.redhat.com//g' | xargs -I '{}' docker tag  $rh_reg'{}' $my_reg'{}'
cat amp.yml | grep -A1  DockerImage | grep name |  sed 's/        name: registry.access.redhat.com//g' | xargs -I '{}' docker push $my_reg'{}'
cat amp.yml | grep -A1  DockerImage | grep name |  sed 's/        name://g' | xargs -I '{}' echo registry.access.redhat.com/3scale-amp2'{}'  '{}'

cat amp.yml  | sed 's/registry.access.redhat.com/'"$reg_ip"':5000/g'  | oc process -p WILDCARD_DOMAIN=13.251.251.251.nip.io -f amp.yml | oc apply -f-




```
