> why not use conflicting network CIDR (like 10.128.0.0/14 ) for openshift SDN when the traffic is going in stay just inside SDN.
credits ejacobs

pods are using the same routing as the host, more or less. So when a packet hits the kernel it has to figure out where to go. Unless you're massaging route tables on every host to ensure that internal cluster traffic isn't trying to get to the real network, and then figuring out how you're going to get cluster traffic out to the real network without some hacky jump host stuff and NATing or something, you probably don't want overlap.

