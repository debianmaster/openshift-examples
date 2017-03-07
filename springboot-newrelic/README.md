>   This is a Openshift s2i template for springboot application with newrelice agent

Two ways to use this example

### Template
```sh
oc create -f https://raw.githubusercontent.com/debianmaster/openshift-examples/master/springboot-newrelic/springboot-newrelic.template.yml
# Select template and create application 
oc start-build  springboot-newrelic-s2i  #if not started automatically
```
Use template for building app,  please trigger builds if they are not triggered by default.


### OR


### oc Commands

```sh
oc new-build https://github.com/debianmaster/springboot-maven3-centos.git#newrelic-agent -e NEWRELIC_LICENSE=<<newrelic_relicense>> -e NEWRELIC_APPNAME=<<newrelice_appname>> --strategy=docker --name=s2i-base 
oc new-app s2i-base~https://github.com/debianmaster/spring-sample-app --name=spring-app
```
