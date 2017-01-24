

>  Create application   
```sh
oc new-app registry.access.redhat.com/dotnet/dotnetcore-10-rhel7~https://github.com/redhat-developer/s2i-dotnetcore-ex --ame=aspnet-app --context-dir=app
```

>  Create Template   
```sh
oc create -f https://raw.githubusercontent.com/redhat-developer/s2i-dotnetcore-ex/master/templates/aspnet-s2i-template.json
```

