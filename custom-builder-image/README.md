> Make a docker image - a builder image with following patch. so it's visible in catalog
```sh
oc patch is s2i-custom-python35 -p '{"spec":{"tags":[{"annotations":{"tags":"builder,python"},"name":"latest"}]}}'
```
