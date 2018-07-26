while oc cp is helpful in copying files into a running container, some times you will see permission errors
i.e.     
`oc cp {{ src }} {{ dst }}` fails with permission error    
for this you can mount a emptDir volume and copy files to that folder instead.  
you can mount a empty dir like this.    
`oc set volume dc/hello-app --add --mount-path /opt/rh/httpd24/root/var/www --type emptyDir` .  
