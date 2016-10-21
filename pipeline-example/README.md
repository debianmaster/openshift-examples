
## Pre-Req 
> (skip this if you have openshift running already) 
```sh
oc cluster up
```

### setup project and jenkins
```sh
oc new-project example-project
oc new-app jenkins-ephemeral
```
### create an example for which you want to setup pipeline
```sh
oc new-app https://github.com/debianmaster/nodejs-welcome.git --name=welcome
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
      jenkinsfile: "node {\nstage 'build'\nopenshiftBuild(buildConfig: 'welcome', showBuildLogs: 'true')\nstage 'deploy'\nopenshiftDeploy(deploymentConfig: 'welcome')\n}"
  output:
  resources:
  postCommit:
```
```sh
oc create -f sample-pipeline.yml -n example-project
```

### Kick off the build and enjoy
```sh
oc start-build sample-pipeline
```

>  More detailed story here
https://github.com/openshift/origin/tree/master/examples/jenkins/pipeline


### Other info (please ignore)
```sh
node {
  stage 'buildIndev'
  openshiftBuild(namespace: 'dev', buildConfig: 'welcome', showBuildLogs: 'true')
  
  stage 'deployIndev'
  openshiftDeploy(namespace: 'dev', deploymentConfig: 'welcome')
  openshiftScale(namespace: 'dev', deploymentConfig: 'welcome',replicaCount: '2')
  
  stage 'deployInQA'
  openshiftTag(namespace: 'dev', sourceStream: 'welcome',  sourceTag: 'latest', destinationStream: 'welcome', destinationTag: 'promoteToQA', destinationNamespace: 'dev')
  
  openshiftDeploy(namespace: 'qa', deploymentConfig: 'welcome', )
  openshiftScale(namespace: 'qa', deploymentConfig: 'welcome',replicaCount: '3')
}
```

```sh
oc policy add-role-to-user edit system:serviceaccount:ci-cd:jenkins -n dev
oc policy add-role-to-user edit system:serviceaccount:ci-cd:jenkins -n testing
oc policy add-role-to-group system:image-puller system:serviceaccounts:qa -n development
oc create deploymentconfig myapp --image=<<RegistryServiceIP>>:5000/dev/myapp:promoteToQA
```

