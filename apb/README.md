```sh
#172.30.0.0/16
#/docker_shared/origin
git clone https://github.com/fusor/catasb
cd catasb/local/mac
sudo ifconfig lo0 alias 192.168.37.1
brew uninstall ansible
pip install ansible
pip install docker-py
sudo chown -R cjonagam:staff /persistedvolumes /docker_shared/origin
sudo ./run_mac_local.sh
```
