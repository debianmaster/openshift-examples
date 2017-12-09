
```sh
cd spring-start-sample
mvn io.fabric8:fabric8-maven-plugin:LATEST:setup
tail -n 30 pom.xml
mvn clean install
mvn fabric8:deploy
mvn fabric8:run
mvn fabric8:debug
```        

```sh

curl https://raw.githubusercontent.com/debianmaster/spring-sample-app/master/schema.sql > schema.sql
mysql -u mysql -p sampledb < schema.sql
oc policy add-role-to-user edit system:serviceaccount:cicd:jenkins -n dev
oc policy add-role-to-user edit system:serviceaccount:cicd:jenkins -n qa

```


## vscode
```sh
# Ctrl + P
ext install vscode-java-debug
```
> launch.json
```json
{
            "type": "java",
            "name": "Debug (Attach)",
            "request": "attach",
            "hostName": "localhost",
            "port": "5005"
        }
```
