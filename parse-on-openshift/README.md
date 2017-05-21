**Parse** is a well known open source mobile backend as a service

> This blogpost focuses  on dashboard and parse server integration. Running parse mobile backend on openshift has been greatly simplified and available in few commands

> Note:-
> If you are using self signed certs for your router, then you need to accept them for dashboard URL and parse server url > otherwise you may see issue



### Create a namespace and provide appropriate permissions
```sh
$ oc new-project parse
$ oc adm policy add-scc-to-user anyuid -z default -n parse
$ oc adm policy add-scc-to-user privileged -z default -n parse
```


### Importing Parse server example template
```sh
$ oc create -f https://raw.githubusercontent.com/parse-community/parse-server-example/master/openshift.json
$ oc new-app parse-server-example  -e APP_ID=myappid -e MASTER_KEY=supersecret
$ oc patch route/parse-server-example -p '{"spec":{"tls": {"termination":"edge"}}}'
$ oc get routes -l app=parse-server-example -o jsonpath='{.items[*].spec.host}'
$ PARSE_SERVER_URL=$(oc get routes -l app=parse-server-example -o jsonpath='{.items[*].spec.host}')
$ PARSE_SERVER_URL='https://'$PARSE_SERVER_URL'/parse'
$ oc volume dc/mongodb --remove --name mongodb-data #incase you dont have persistent volume
```


### Deploy Parse Dashboard
```sh
$ oc project parse
$ oc new-app https://github.com/parse-community/parse-dashboard.git \
-e PARSE_DASHBOARD_ALLOW_INSECURE_HTTP=true \
-e PARSE_DASHBOARD_SERVER_URL=$PARSE_SERVER_URL \
-e PARSE_DASHBOARD_MASTER_KEY="supersecret" \
-e PARSE_DASHBOARD_APP_ID="myappid" \
-e PARSE_DASHBOARD_APP_NAME="MyApp" \
-e PARSE_DASHBOARD_USER_ID="user1" \
-e PARSE_DASHBOARD_USER_PASSWORD="pass"
$ oc expose dc parse-dashboard --port=4040
$ oc expose svc parse-dashboard
$ oc patch route/parse-dashboard -p '{"spec":{"tls": {"termination":"edge"}}}'
$ oc get routes
```


### How to use?
```console
open dashboard url and use following credentials for logging into parse dashboard user1/pass
```
