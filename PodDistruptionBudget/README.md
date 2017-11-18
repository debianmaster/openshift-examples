#### this is just for my learning.  use with caution.

Consider a use case where
1) i can call application X is healthy only if certian # of replicas are up.
2) i want to protect this application from an operations girl/guy accidentally evicting a pod from node.

PodDistruptionBudget  protects application pods from such voluntery evictions 
