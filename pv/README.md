> Fix folder permission errors while using PV mount 
> Not tested

```sh
initContainers:
  - name: volume-mount-hack
    image: busybox
    command: ["sh", "-c", "chown -R 200:200 /nexus"]
    volumeMounts:
    - name: <your nexus volume>
      mountPath: /nexus
```  
