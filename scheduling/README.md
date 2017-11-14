# WIP

## Default labels
1) kubernetes.io/hostname  
2) failure-domain.beta.kubernetes.io/zone  
3) failure-domain.beta.kubernetes.io/region  
4) beta.kubernetes.io/instance-type  
5) beta.kubernetes.io/os  
6) beta.kubernetes.io/arch 
 
> The affinity feature consists of two types of affinity, “node affinity” and “inter-pod affinity/anti-affinity.”

## Node Affinity
### Hard
requiredDuringSchedulingIgnoredDuringExecution

### Soft
preferredDuringSchedulingIgnoredDuringExecution. 
