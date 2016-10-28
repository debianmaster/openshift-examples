
## Pre-Req 
> (skip this if you have openshift running already) 
```sh
oc cluster up
```

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
> Create a file sample-pipeline.yml
```yml
apiVersion: v1
kind: BuildConfig
metadata:
  name: sample-pipeline
  labels:
    app: jenkins-pipeline-example
    name: sample-pipeline
    template: application-template-sample-pipeline
  annotations:
    pipeline.alpha.openshift.io/uses: '[{"name": "frontend", "namespace": "", "kind": "DeploymentConfig"}]'
spec:
  runPolicy: Serial
  source:
    type: None
  strategy:
    type: JenkinsPipeline
    jenkinsPipelineStrategy:
      jenkinsfile: "node {}"
  output:
  resources:
  postCommit:
```


```sh
oc create -f sample-pipeline.yml -n dev
```

### Update Jenkinds pipeline


```sh
node {
  stage 'buildIndev'
  openshiftBuild(namespace: 'dev', buildConfig: 'welcome', showBuildLogs: 'true')
  
  stage 'deployIndev'
  openshiftDeploy(namespace: 'dev', deploymentConfig: 'welcome')
  openshiftScale(namespace: 'dev', deploymentConfig: 'welcome',replicaCount: '2')
 
}
```


```sh
oc policy add-role-to-user edit system:serviceaccount:ci-cd:jenkins -n dev
oc policy add-role-to-group system:image-puller system:serviceaccounts:ci-cd -n dev
```


### Kick off the build and enjoy
```sh
oc start-build sample-pipeline -n ci-cd
```

>  More detailed story here
https://github.com/openshift/origin/tree/master/examples/jenkins/pipeline
https://jenkins.io/doc/pipeline/steps/openshift-pipeline/#code-openshiftscale-code-scale-openshift-deployment


