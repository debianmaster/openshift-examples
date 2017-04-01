```yaml
---
kind: ImageStream
apiVersion: v1
metadata:
  name: redhat-openjdk18-openshift
spec:
  dockerImageRepository: registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift
  tags:
  - name: '1.0'
    annotations:
      openshift.io/display-name: Red Hat OpenJDK 8
      description: Build and run Java applications using Maven and OpenJDK 8.
      iconClass: icon-jboss
      tags: builder,java,xpaas,openjdk
      supports: java:8,xpaas:1.0
      sampleRepo: https://github.com/jboss-openshift/openshift-quickstarts
      sampleContextDir: undertow-servlet
      version: '1.0'

```
