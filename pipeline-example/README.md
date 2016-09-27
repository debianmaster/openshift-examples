
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

### Make your build config openshift pipeline friendly
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
