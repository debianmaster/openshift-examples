> Openshift Reference Architecture implementation based on
https://github.com/openshift/openshift-ansible-contrib

```sh
export AWS_ACCESS_KEY_ID='AKIAIFSECRETDUMMYDPB3A'
export AWS_SECRET_ACCESS_KEY='bhADUMMYSECRETNo8'

git clone https://github.com/openshift/openshift-ansible-contrib 
cd openshift-ansible-contrib/reference-architecture/aws-ansible/

./ose-on-aws.py -v --keypair=ck_australia \
--region=ap-southeast-2 --public-hosted-zone=ck.osecloud.com \
--deployment-type=origin --ami=ami-19e7c57a --stack-name=origincluster \
--github-client-secret=884a47879SECRETTOP74d812a801 \
--github-organization=openshift-org  --github-client-id=998dfYYYYYad6372 \
--containerized=true --key-path=~/.ssh/id_rsa.pub


ansible-playbook -e 'public_hosted_zone=cloud.expdddctory.com \
    wildcard_zone=apps.cloud.expdddctory.com \
    openshift_deployment_type=origin \
    gcs_registry_bucket=example-openshift-docker-registry \
    gce_project_id=enhanced-myproj-157823 \
    gce_network_name=ocp-network' \
    playbooks/openshift-install.yaml
```
