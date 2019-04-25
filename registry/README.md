```sh
regip=172.17.0.2
for i in $(curl -s -X GET http://$regip:5000/v2/_catalog | jq -r .repositories[]); do
    echo "$i:"
    echo -n "  "
    curl -s -X GET http://$regip:5000/v2/$i/tags/list | jq -c .tags
done
```
