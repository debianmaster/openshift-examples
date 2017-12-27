kubectl create secret docker-registry hub-secret --docker-server=docker.io \
--docker-username=debianmaster --docker-password=mypassss --docker-email=9chakri@gmail.com

kubectl patch serviceaccount default \
  -p "{\"imagePullSecrets\": [{\"name\": \"hub-secret\"}]}"
