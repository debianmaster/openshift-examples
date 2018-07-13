### WIP , do not use.


```sh
yum remove go -y
yum install git wget docker createrepo rpm-build krb5-devel bsdtar -y
systemctl restart docker
wget https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz
tar -xzf go1.10.3.linux-amd64.tar.gz
mv go /usr/local
export GOROOT=/usr/local/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
git clone git://github.com/openshift/origin
cd origin
make release
ls _output/local/bin/linux/amd64/
```
