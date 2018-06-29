```sh
oc patch scc restricted --patch {\"allowedCapabilities\":[\"NET_ADMIN\"]}
oc patch scc restricted --patch {\"allowedCapabilities\":[\"NET_CAP_ADMIN\"]}
```
