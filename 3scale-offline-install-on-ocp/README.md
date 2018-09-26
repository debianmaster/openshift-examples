> Do this activity from a laptop which has access to internet  and also openshift.
##  Set environment details
```sh
export rh_reg=registry.access.redhat.com
export my_reg=docker-registry-default.13.251.251.251.nip.io
export wildcard_domain=13.251.251.251.nip.io
```

## Edit the docker registry :

### 1. OCP master node add following in /etc/sysconfig/docker file 
```
added : --insecure-registry docker-registry-default.13.251.251.251.nip.io --insecure-registry docker-registry.default.svc:5000 --insecure-registry 172.30.1.1:5000'
example :
----
OPTIONS='--selinux-enabled --log-driver=journald --signature-verification=false --insecure-registry 172.30.0.0/16 --insecure-registry docker-registry-default.13.251.251.251.nip.io --insecure-registry docker-registry.default.svc:5000 --insecure-registry 172.30.1.1:5000'
---
```



##  Sync docker images to disconnected openshift
```sh
oc new-project my-proj
wget https://raw.githubusercontent.com/3scale/3scale-amp-openshift-templates/master/amp/amp.yml 
oc new-project  rhscl
oc new-project  3scale-amp22
oc project my-proj
oc policy add-role-to-user system:image-puller system:serviceaccount:my-proj:default -n 3scale-amp22
oc policy add-role-to-user system:image-puller system:serviceaccount:my-proj:default -n rhscl
docker login -u $(oc whoami) -p $(oc whoami -t) $my_reg

alias get_rh_img_list="cat amp.yml | grep  -o 'registry.access[^ ]*' | sed -e 's/\"//'"
alias get_image_names="get_rh_img_list | sed 's/'"$rh_reg"'//' | sed 's/^\///g'"
get_rh_img_list | xargs -n 1 docker pull
get_image_names | xargs -I '{}' docker tag  $rh_reg/'{}' $my_reg/'{}'
get_image_names | xargs -I '{}' docker push $my_reg/'{}'
```
## Deploy 3scale from synced images
```
export reg_ip=$(oc get svc docker-registry -n default --no-headers | awk '{ print $3}')
cat amp.yml  | sed 's/'"$rh_reg"'/'"$reg_ip"':5000/g'  | oc process -p WILDCARD_DOMAIN=$wildcard_domain -f amp.yml | oc apply -f-
```

