
### Deploying prometheus
> In `kube-system` namespace look for prometheus template from catalog and deploy.

### Alert via slack when total number of pods inside openshift > 15 across all namespaces
> modify configmaps as followd in `kube-system` namesapce after prometheus is deployed from step above.

> alertmanager.yml
```yaml
global:
  slack_api_url: 'https://hooks.slack.com/services/dummy/dummy/dummydummy'
route:
  receiver: 'slack-notifications'
  group_by: []
  repeat_interval: 10s
receivers:
- name: alert-buffer-wh
  webhook_configs:
  - url: http://localhost:9099/topics/alerts
- name: 'slack-notifications'
  slack_configs:
  - channel: '#testchannel'
    text: 'https://internal.myorg.net/wiki/alerts'
 ```
 
> alerting.rules
```yaml
groups:
- name: example-rules
  interval: 5s # defaults to global interval
  rules:
  - alert: Node Down
    expr: up{job="kubernetes-nodes"} == 0
    annotations:
      miqTarget: "ContainerNode"
      severity: "HIGH"
      message: "{{$labels.instance}} is down"
  - alert: "Too Many Pods"
    annotations: 
      message: "Too many running pods"
      miqTarget: ExtManagementSystem
      severity: ERROR
      url: "https://xyz"
    expr: "sum(kubelet_running_pod_count) > 15"
 ```
 
> kill prometheus pod to reload configmap and scale pods so as to make total number of pods > 15 across all namespaces, this should trigger an alert
