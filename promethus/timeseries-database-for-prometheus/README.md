> what time series database we can use it in the Prometheus?    
credits . @cpitman

Prometheus is a time-series database.  
Scalability and durability can be handled by Prometheus without pulling in remote storage:   

Durability = run more than one identical instance of Prometheus. These are not "clustered", each instance will scrape the same metrics. That means they will store similar (but not identical) data, since they may scrape at slightly different times. If one instance goes down, the other instances still have a copy of all data.   (https://coreos.com/operators/prometheus/docs/latest/high-availability.html)   

Scalability = run more than one instance of Prometheus, with different configurations that "shard" the scrape targets. This reduces the load on each instance. (https://prometheus.io/docs/prometheus/latest/federation/)
