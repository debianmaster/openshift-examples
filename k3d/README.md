```sh
➜  k3d tree containerd/
containerd/
├── config.toml .  #generated
└── config.toml.tmpl
```

```sh
k3d create --version=v0.5.0 -n test2 --volume $(pwd)/containerd/:/var/lib/rancher/k3s/agent/etc/containerd/
```
