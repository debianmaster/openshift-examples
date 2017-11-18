#### This is just for my learning.  use with caution.

Consider a use case where
1) i can call application X is healthy only if certain # of replicas are up.
2) i want to protect this application from an operations girl/guy accidentally evicting a pod/node causing replicas to go down

PodDistruptionBudget  protects application pods from such voluntary evictions 

