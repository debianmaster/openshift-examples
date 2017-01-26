node {
  stage 'build in development'
  openshiftBuild(namespace: 'dev', buildConfig: 'welcome', showBuildLogs: 'true')
  
  stage 'deploy in development'
  openshiftDeploy(namespace: 'dev', deploymentConfig: 'welcome')
  openshiftTag(namespace: 'dev', sourceStream: 'welcome',  sourceTag: 'latest', destinationStream: 'welcome', destinationTag: 'promoteToQA', destinationNamespace: 'dev')

  stage 'deploy in QA'
  openshiftDeploy(namespace: 'qa', deploymentConfig: 'welcome')

  stage 'scale dev and QA'
  openshiftScale(namespace: 'dev', deploymentConfig: 'welcome',replicaCount: '2')
  openshiftScale(namespace: 'qa', deploymentConfig: 'welcome',replicaCount: '3')
}
