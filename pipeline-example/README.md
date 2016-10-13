
## pre-req
```sh
oc cluster up
```

### setup project and jenkins
```sh
oc new-project example-project
oc new-app jenkins-ephemeral
```
### create an example project from template
```sh
oc new-app jenkins-pipeline-example
```

###  create a new buildconfig for pipelines 
>  sample-pipeline is already created for you as part of jenkins-pipeline-example app creation, there is a a small bug edit as follows    

```sh
oc edit bc sample-pipeline
```
> Change strategy as follows   

```yml
strategy:
    jenkinsPipelineStrategy:
      jenkinsfile: |-
        node {
        stage 'build'
        openshiftBuild(buildConfig: 'ruby-sample-build', showBuildLogs: 'true')
        stage 'deploy'
        openshiftDeploy(deploymentConfig: 'frontend')
        }
    type: JenkinsPipeline
```

### Kick off the build and enjoy
```sh
oc start-build sample-pipeline
```
>  More detailed story here
https://github.com/openshift/origin/tree/master/examples/jenkins/pipeline




###  just my notes, ignore notes below

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
      jenkinsfile: "node {\nstage 'build'\nopenshiftBuild(buildConfig: 'myphp', showBuildLogs: 'true')\nstage 'deploy'\nopenshiftDeploy(deploymentConfig: 'myphp')\n}"
  output:
  resources:
  postCommit:

```
