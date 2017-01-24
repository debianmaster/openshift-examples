`oc new-app registry.access.redhat.com/dotnet/dotnetcore-10-rhel7~https://github.com/redhat-developer/s2i-dotnetcore-ex --name=aspnet-app --context-dir=app`
`oc create -f https://raw.githubusercontent.com/redhat-developer/s2i-dotnetcore-ex/master/templates/aspnet-s2i-template.json`

