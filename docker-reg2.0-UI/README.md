```sh
export REG_SHA256="f644bf8429a20c3dd19527c5f25d239b3c2544dcc65daeaa7bae6dc7fb117d61"

curl -fSL "https://github.com/genuinetools/reg/releases/download/v0.16.0/reg-darwin-amd64" -o "/usr/local/bin/reg" \
> && echo "${REG_SHA256}  /usr/local/bin/reg" | sha256sum -c - \
> && chmod a+x "/usr/local/bin/reg"

reg server -k -u registry-user-here -p registry-pass-here -r target-reg:5000
```
