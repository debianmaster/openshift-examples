```sh
➜  k3d tree containerd/
containerd/
├── config.toml .  #generated
└── config.toml.tmpl
```

```sh
k3d create --version=v0.5.0 -n test2 --volume $(pwd)/containerd/:/var/lib/rancher/k3s/agent/etc/containerd/
```


```sh
➜  k3d cat containerd/config.toml.tmpl
[plugins.opt]
path = "{{ .NodeConfig.Containerd.Opt }}"
[plugins.cri]
stream_server_address = "{{ .NodeConfig.AgentConfig.NodeName }}"
stream_server_port = "10010"
{{- if .IsRunningInUserNS }}
disable_cgroup = true
disable_apparmor = true
restrict_oom_score_adj = true
{{ end -}}
{{- if .NodeConfig.AgentConfig.PauseImage }}
sandbox_image = "{{ .NodeConfig.AgentConfig.PauseImage }}"
{{ end -}}
{{- if not .NodeConfig.NoFlannel }}
  [plugins.cri.cni]
    bin_dir = "{{ .NodeConfig.AgentConfig.CNIBinDir }}"
    conf_dir = "{{ .NodeConfig.AgentConfig.CNIConfDir }}"
{{ end -}}
  [plugins.cri.registry]
    [plugins.cri.registry.mirrors]
      [plugins.cri.registry.mirrors."docker.io"]
        endpoint = ["https://registry-1.docker.io"]
      [plugins.cri.registry.mirrors."sample-registry.local:5000"]
        endpoint = ["https://sample-registry.local:5000"]
```
