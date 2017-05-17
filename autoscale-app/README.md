> Set mem/cpu limits first 

```sh
 oc autoscale rc/foo --min=2 --max=5 --cpu-percent=80
```
