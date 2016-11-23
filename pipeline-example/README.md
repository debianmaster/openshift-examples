> This only works on OCP 3.3.0.35 or later


### setup project and jenkins
```sh
oc new-project dev
oc new-project qa
oc new-project ci-cd
oc new-app jenkins-ephemeral -n ci-cd
```
### create an example for which you want to setup pipeline
```sh
oc new-app https://github.com/debianmaster/nodejs-welcome.git --name=welcome -n dev
```

###  create a new buildconfig for pipelines 

```sh
oc create -f https://raw.githubusercontent.com/debianmaster/openshift-examples/master/pipeline-example/sample-pipeline -n ci-cd
```


```sh
oc policy add-role-to-user edit system:serviceaccount:ci-cd:jenkins -n dev
oc policy add-role-to-group system:image-puller system:serviceaccounts:ci-cd -n dev
oc policy add-role-to-user edit system:serviceaccount:ci-cd:jenkins -n qa
oc policy add-role-to-group system:image-puller system:serviceaccounts:ci-cd -n qa
oc policy add-role-to-group system:image-puller system:serviceaccounts:qa -n dev
oc create deploymentconfig welcome --image=172.30.178.114:5000/dev/welcome:promoteToQA -n qa
oc create deploymentconfig welcome --image=docker-registry.default.svc.cluster.local:5000/dev/welcome:promoteToQA -n qa
oc expose dc welcome --port=8080 -n qa
oc expose svc welcome  -n qa
```


### Kick off the build and enjoy
```sh
oc start-build sample-pipeline -n ci-cd
```


### Cleanup
```sh
oc delete project dev qa ci-cd
```
>  More detailed story here
https://github.com/openshift/origin/tree/master/examples/jenkins/pipeline
https://jenkins.io/doc/pipeline/steps/openshift-pipeline/#code-openshiftscale-code-scale-openshift-deployment


