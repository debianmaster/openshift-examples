Command line
```sh
oc set probe dc/mapit --liveness --get-url=http://:8080/health --initial-delay-seconds=30
```

Add this section in DeploymentConfig

```yml
livenessProbe:
  # an http probe
  httpGet:
    path: /healthz
    port: 8080
    initialDelaySeconds: 15
    timeoutSeconds: 1
```
> Apply with patch command
```
kubectl patch deployment welcome --type='json' -p='[{"op": "add","path": "/spec/template/spec/containers/0/livenessProbe","value":{"httpGet":{"path":"/healthz","port":"liveness-port"}}}]'
```

> Full Deployment config    

```yml
apiVersion: v1
kind: DeploymentConfig
metadata:
  name: welcome
  namespace: sample
  selfLink: /oapi/v1/namespaces/sample/deploymentconfigs/welcome
  uid: c528638d-7050-11e6-a07d-525400659b2e
  resourceVersion: '5789'
  creationTimestamp: '2016-09-01T14:31:28Z'
  labels:
    app: welcome
  annotations:
    openshift.io/generated-by: OpenShiftWebConsole
spec:
  strategy:
    type: Rolling
    rollingParams:
      updatePeriodSeconds: 1
      intervalSeconds: 1
      timeoutSeconds: 600
      maxUnavailable: 25%
      maxSurge: 25%
    resources: {  }
  triggers:
    -
      type: ImageChange
      imageChangeParams:
        automatic: true
        containerNames:
          - welcome
        from:
          kind: ImageStreamTag
          name: 'welcome:latest'
        lastTriggeredImage: '172.30.240.125:5000/sample/welcome@sha256:9b18a5ca44a3809bebc71eea76df65862e75435ee26469d45fe75c0b46553f64'
    -
      type: ConfigChange
  replicas: 1
  test: false
  selector:
    deploymentconfig: welcome
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: welcome
        deploymentconfig: welcome
    spec:
      containers:
        -
          name: welcome
          image: '172.30.240.125:5000/sample/welcome@sha256:9b18a5ca44a3809bebc71eea76df65862e75435ee26469d45fe75c0b46553f64'
          ports:
            -
              containerPort: 8080
              protocol: TCP
          resources:
            limits:
              cpu: 200m
              memory: 200Mi
            requests:
              cpu: 180m
              memory: 180Mi
          terminationMessagePath: /dev/termination-log
          imagePullPolicy: Always
          ##############  This section added for Health check  #####
          livenessProbe:
            httpGet:
              path: /healthz
              port: 8080
              scheme: HTTP
            timeoutSeconds: 1
            periodSeconds: 5
            successThreshold: 1
            failureThreshold: 1
          ####################   end health check config   ###########
      restartPolicy: Always
      terminationGracePeriodSeconds: 30
      dnsPolicy: ClusterFirst
      securityContext: {  }
status:
  latestVersion: 2
  details:
    causes:
      -
        type: ConfigChange
```
