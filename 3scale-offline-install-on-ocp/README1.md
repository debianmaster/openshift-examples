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

alias get_rh_img_list="cat amp.yml | grep  -o 'registry.access[^ ]*' | sed -e 's/\"//'"
alias get_image_names="get_rh_img_list | sed 's/'"$rh_reg"'//' | sed 's/^\///g'"
get_rh_img_list | xargs -n 1 docker pull
get_image_names | xargs -I '{}' docker tag  $rh_reg/'{}' $my_reg/'{}'

get_image_names | xargs -I '{}' docker push $my_reg/'{}'


cat amp.yml  | sed 's/'"$rh_reg"'/'"$reg_ip"':5000/g'  | oc process -p WILDCARD_DOMAIN=13.251.251.251.nip.io -f amp.yml | oc apply -f-




```
