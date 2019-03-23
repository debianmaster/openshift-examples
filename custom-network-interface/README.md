> default ip for a host comes from following output
```sh
ip -4 route get 8.8.8.8
```
> if you wish you overwrite and use a different interface the do this
```
route add -net 8.8.8.8 netmask 255.255.255.255 wg0
```
