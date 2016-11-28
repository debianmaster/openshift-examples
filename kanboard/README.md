```sh
oc new-project board
oc new-build https://github.com/kanboard/kanboard.git --strategy=kanboard
oc new-app kanboard
oc expose svc kanboard 
```
