> Set mem/cpu limits first 
```sh
oc set resources dc foo --limits=cpu=200m,memory=512Mi --requests=cpu=100m,memory=256M
```
> Set HPA

```sh
 oc autoscale dc/foo --min=2 --max=5 --cpu-percent=80
```
