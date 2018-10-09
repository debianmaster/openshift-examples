> This is not working


> Fix folder permission errors while using PV mount 


```sh
initContainers:
  - name: volume-mount-hack
    image: busybox
    command: ["sh", "-c", "chown -R 200:200 /nexus"]
    volumeMounts:
    - name: <your nexus volume>
      mountPath: /nexus
```  


https://kubernetes.io/docs/tasks/configure-pod-container/security-context/  





> Some fancy hacks which i did not like , notice runAsUser,privileged, for init container and runAsNonRoot: false to make 
/hadoop/dfs/data    owned by user 1002 (hadoop)   

```yml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  creationTimestamp: null
  generation: 21
  labels:
    app: hdfs-datanode
  name: hdfs-datanode
  ownerReferences:
  - apiVersion: metering.openshift.io/v1alpha1
    blockOwnerDeletion: false
    controller: true
    kind: Metering
    name: openshift-metering
    uid: e652a3f5-cbac-11e8-8bc4-0007cb0b9eb2
spec:
  podManagementPolicy: OrderedReady
  replicas: 1
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      app: hdfs-datanode
  serviceName: hdfs-datanode
  template:
    metadata:
      annotations:
        hdfs-configmap-hash: 7ad41f2158f17e2d03e9a5c70e68ee08fca64403d247fc0b50a5a1487e959da3
      creationTimestamp: null
      labels:
        app: hdfs-datanode
    spec:
      affinity:
        podAntiAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
          - labelSelector:
              matchExpressions:
              - key: app
                operator: In
                values:
                - hdfs-datanode
            topologyKey: kubernetes.io/hostname
      containers:
      - args:
        - datanode-entrypoint.sh
        env:
        - name: CORE_CONF_fs_defaultFS
          valueFrom:
            configMapKeyRef:
              key: default-fs
              name: hdfs-config
        - name: HDFS_CONF_dfs_datanode_data_dir_perm
          valueFrom:
            configMapKeyRef:
              key: datanode-data-dir-perms
              name: hdfs-config
        - name: HADOOP_LOGLEVEL
          valueFrom:
            configMapKeyRef:
              key: log-level
              name: hdfs-config
        - name: MY_NODE_NAME
          valueFrom:
            fieldRef:
              apiVersion: v1
              fieldPath: spec.nodeName
        - name: MY_POD_NAME
          valueFrom:
            fieldRef:
              apiVersion: v1
              fieldPath: metadata.name
        - name: MY_POD_NAMESPACE
          valueFrom:
            fieldRef:
              apiVersion: v1
              fieldPath: metadata.namespace
        - name: MY_MEM_REQUEST
          valueFrom:
            resourceFieldRef:
              containerName: hdfs-datanode
              divisor: "0"
              resource: requests.memory
        - name: MY_MEM_LIMIT
          valueFrom:
            resourceFieldRef:
              containerName: hdfs-datanode
              divisor: "0"
              resource: limits.memory
        - name: JAVA_MAX_MEM_RATIO
          value: "50"
        image: quay.io/coreos/metering-hadoop:0.7.0-latest
        imagePullPolicy: Always
        livenessProbe:
          exec:
            command:
            - check-datanode-healthy.sh
          failureThreshold: 2
          initialDelaySeconds: 90
          periodSeconds: 30
          successThreshold: 1
          timeoutSeconds: 1
        name: hdfs-datanode
        ports:
        - containerPort: 50010
          name: fs
          protocol: TCP
        - containerPort: 50075
          name: http
          protocol: TCP
        resources:
          limits:
            cpu: 250m
            memory: 250Mi
          requests:
            cpu: 250m
            memory: 250Mi
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
        volumeMounts:
        - mountPath: /hadoop/dfs/data
          name: hdfs-datanode-data
          subPath: hadoop/dfs/data
        - mountPath: /hadoop/dfs/name
          name: namenode-empty
      dnsPolicy: ClusterFirst
      initContainers:
      - command:
        - sh
        - -c
        - chown -R 1002:1002 /hadoop/dfs/data
        image: busybox
        imagePullPolicy: Always
        name: volume-mount-hack
        resources: {}
        securityContext:
          privileged: true
          runAsUser: 0
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
        volumeMounts:
        - mountPath: /hadoop/dfs/data
          name: hdfs-datanode-data
          subPath: hadoop/dfs/data
      - command:
        - /bin/bash
        - -c
        - until host $NAMENODE_HOST; do echo waiting for $NAMENODE_HOST; sleep 2;
          done;
        env:
        - name: NAMENODE_HOST
          valueFrom:
            configMapKeyRef:
              key: namenode-host
              name: hdfs-config
        image: quay.io/coreos/metering-hadoop:0.7.0-latest
        imagePullPolicy: Always
        name: wait-for-namenode
        resources:
          limits:
            cpu: 50m
            memory: 50Mi
          requests:
            cpu: 10m
            memory: 5Mi
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
        volumeMounts:
        - mountPath: /hadoop/dfs/data
          name: hdfs-datanode-data
          subPath: hadoop/dfs/data
        - mountPath: /hadoop/dfs/name
          name: namenode-empty
      restartPolicy: Always
      schedulerName: default-scheduler
      securityContext:
        runAsNonRoot: false
        runAsUser: 1002
      serviceAccount: hdfs
      serviceAccountName: hdfs
      terminationGracePeriodSeconds: 30
      volumes:
      - emptyDir: {}
        name: namenode-empty
  updateStrategy:
    type: RollingUpdate
  volumeClaimTemplates:
  - metadata:
      creationTimestamp: null
      labels:
        app: hdfs-datanode
      name: hdfs-datanode-data
    spec:
      accessModes:
      - ReadWriteOnce
      resources:
        requests:
          storage: 5Gi
    status:
      phase: Pending
status:
  collisionCount: 0
  currentReplicas: 1
  currentRevision: hdfs-datanode-7f86b94778
  observedGeneration: 21
  readyReplicas: 1
  replicas: 1
  updateRevision: hdfs-datanode-7f86b94778
  updatedReplicas: 1

````
