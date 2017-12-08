
```sh
cd spring-start-sample
mvn io.fabric8:fabric8-maven-plugin:LATEST:setup
tail -n 30 pom.xml
mvn clean install
mvn fabric8:deploy
mvn fabric8:run
mvn fabric8:debug
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
