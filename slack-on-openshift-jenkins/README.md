### WIP 

### Get a token from here
https://my.slack.com/services/new/jenkins-ci

### Install jenkins plugin 
Manage Jenkins > Manage Plugins > Search for Slack in the Available tab > Install Slack Notification Plugin

### Configure Jenkins integration
Go to Manage Jenkins > Configure System > Find the Global Slack Notifier Settings section and add the provided values in the instruction for Team Domain and Integration Token. The other fields are optional. Press the Save button.
Click on Test Connection to verify that your settings are correct.

### Use slack notification
``` slackSend (color: '#FFFF00', message: "STARTED: Job")```




> https://jenkins.io/blog/2017/02/15/declarative-notifications/
