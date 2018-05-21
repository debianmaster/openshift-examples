
###  Unable to resolve external domains
```
Cloning "https://github.com/openshift/nodejs-ex.git " ...
error: fatal: unable to access 'https://github.com/openshift/nodejs-ex.git/':  Could not resolve host: github.com; Unknown error
```

step 1:   Check for resolv.conf inside pod
```sh
/ $ cat /etc/resolv.conf
nameserver 10.1.75.175
search dev.svc.cluster.local svc.cluster.local cluster.local cloud.online.net
options ndots:5
```

> This looks good as pod is pointing to node for ns and search string looks accurate

Step 2: Fix
> you need to add upstream dns ex:-   8.8.8.8  to fix this.
``` 
cat /etc/dnsmasq.d/origin-upstream-dns.conf
server=8.8.8.8
```
```
systemctl restart dnsmasq
```




