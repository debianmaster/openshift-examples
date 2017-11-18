I have 1 replica of database with label `app=database`   
I want `3` replicas of another pod with label `app=webserver` with podAffinity constraint of (`app=database` and `requiredDuringSchedulingIgnoredDuringExecution`)   

I expect all `app=webserver` pods to scheduled on same server where `app=database` pod is residiing
