## Set deployment hook
```
oc set deployment-hook dc/tensorflow --post -- /bin/sh -c 'echo helloworld'
```
