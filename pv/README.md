> This is not working


> Fix folder permission errors while using PV mount 


```sh
initContainers:
  - name: volume-mount-hack
    image: busybox
    command: ["sh", "-c", "chown -R 200:200 /nexus"]
    volumeMounts:
    - name: <your nexus volume>
      mountPath: /nexus
```  


https://kubernetes.io/docs/tasks/configure-pod-container/security-context/  
