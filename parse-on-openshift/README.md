Env vars for Dashboard

PARSE_DASHBOARD_ALLOW_INSECURE_HTTP=true 
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
PARSE_DASHBOARD_TRUST_PROXY=1


> Deploy Dashboard
oc new-build https://github.com/parse-community/parse-dashboard.git  --name=dash
oc new-app dash 



### notes:
expose all routes on https
