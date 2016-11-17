 oc new-app docker.io/mysql --name=my-mysql -e MYSQL_ROOT_PASSWORD=password
 export pod=$(oc get pods | grep Running | grep my-mysql | awk '{print $1}')
 oc port-forward $pod 3306 
 
 
