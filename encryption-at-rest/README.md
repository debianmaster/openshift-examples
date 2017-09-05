### Work in progress

## Step 1
> Start api server with `--experimental-encryption-provider-config`  flag

## Setp 2
> flag should point to a file with follwoing content.    this will encrypt all configmaps going forward

```yaml
kind: EncryptionConfig
apiVersion: v1
resources:
  - resources: 
      - configmaps
    providers:
      - aescbc:
          keys:
            - name: mykey
              secret: HON5ISH9XMfFB6dnm25U0vSwxR58n7UrpxKPvmCJLTw=
 ```
 
 ## Step 3
 > Now all the configmaps are ecnrypted in etcd and decrypted automatically when requested via API
 
