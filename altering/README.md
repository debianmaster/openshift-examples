## WIP
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
