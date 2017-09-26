```sh
oc adm create-node-config \
    --master='https://192.168.65.2:8443' \
    --node-dir=ocp/openshift \
    --node=openshift \
    --hostnames=openshift,192.168.99.100 \
    --certificate-authority="ocp/master/ca.crt" \
    --signer-cert="ocp/master/ca.crt" \
    --signer-key="ocp/master/ca.key" \
    --signer-serial="ocp/master/ca.serial.txt" \
    --node-client-certificate-authority="ocp/master/ca.crt"


openshift start node --config=config.yml
```
