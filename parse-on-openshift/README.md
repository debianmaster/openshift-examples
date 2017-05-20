oc create -f https://raw.githubusercontent.com/debianmaster/openshift-examples/master/parse-on-openshift/template.json   
Env vars for Dashboard

PARSE_DASHBOARD_ALLOW_INSECURE_HTTP=true 
PARSE_DASHBOARD_TRUST_PROXY=1
PARSE_DASHBOARD_CONFIG=
```json
{
  "apps": [
    {
      "serverURL": "https://parse-server-example-test.10.0.0.145.xip.io/parse",
      "appId": "myappId",
      "masterKey": "supersecret",
      "appName": "myappId",
      "javascriptKey": "supersecret",
      "restKey": "supersecret",
      "production": true
    }
  ],
  "users": [
    {
      "user": "user1",
      "pass": "pass"
    },
    {
      "user": "user2",
      "pass": "pass"
    }
  ]
}
```

> Deploy Dashboard
```console
oc new-app https://github.com/parse-community/parse-dashboard.git  --name=dash   
oc adm policy add-scc-to-user anyuid -z default   
oc adm policy add-scc-to-user privileged -z default   
oc expose dc dash --port=4040
oc expose svc dash
```





### notes:
expose all routes on https
