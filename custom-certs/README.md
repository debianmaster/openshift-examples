```sh
servingInfo:
  ...
  namedCertificates:
  - certFile: custom.crt
    keyFile: custom.key
    names:
    - "customhost.com"
    - "api.customhost.com"
    - "console.customhost.com"
  - certFile: wildcard.crt
    keyFile: wildcard.key
    names:
    - "*.wildcardhost.com"
  ...
 ```


```sh
openshift_master_overwrite_named_certificates=true
openshift_master_named_certificates=[{"certfile": "/path/to/custom1.crt", "keyfile": "/path/to/custom1.key", "names": ["public-master-host.com"]}]
```

```sh

ansible-playbook 
    /usr/share/ansible/openshift-ansible/playbooks/byo/openshift-cluster/redeploy-master-certificates.yml
```



Ex:- 


```yaml
servingInfo:
  bindAddress: 0.0.0.0:8443
  bindNetwork: tcp4
  certFile: master.server.crt
  clientCA: ca.crt
  keyFile: master.server.key
  maxRequestsInFlight: 1200
  namedCertificates:
  - certFile: /etc/letsencrypt/archive/aws.ck.osecloud.com/fullchain1.pem
    keyFile: /etc/letsencrypt/archive/aws.ck.osecloud.com/privkey1.pem
    names:
    - "aws.ck.osecloud.com"
 ```
