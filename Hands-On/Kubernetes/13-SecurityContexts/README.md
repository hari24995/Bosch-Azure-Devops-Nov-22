# Security Context
- In Kubernetes, a securityContext defines privilege and access control settings for a Pod or Container

## Set the security context for a Pod
- To specify security settings for a Pod, include the securityContext field in the Pod specification
- Refer: kube-manifests/security-context.yaml

## Details of Configuration file
- In the configuration file, the runAsUser field specifies that for any Containers in the Pod, all processes run with user ID 1000
- The runAsGroup field specifies the primary group ID of 3000 for all processes within any containers of the Pod
- If this field is omitted, the primary group ID of the containers will be root(0)
- The owner for volume /data/demo and any files created in that volume will be Group ID 2000.

## Create the Pod:
```
kubectl apply -f kube-manifests/security-context.yaml
```

## Verify that the Pod's Container is running:
```
kubectl get pod security-context-demo
```

## Get a shell to the running Container:
```
kubectl exec -it security-context-demo -- sh
```

## In your shell, list the running processes:
```
ps
```

- The output shows that the processes are running as user 1000, which is the value of runAsUser

- In your shell, navigate to /data, and list the one directory
```
cd /data
ls -l
```

- The output shows that the /data/demo directory has group ID 2000, which is the value of fsGroup.

- In your shell, navigate to /data/demo, and create a file:
```
cd demo
echo hello > testfile
```

- List the file in the /data/demo directory:
```
ls -l
```

- The output shows that testfile has group ID 2000, which is the value of fsGroup.

- Run the following command:
```
id
```

- The output is similar to this:
```
uid=1000 gid=3000 groups=2000
```

- From the output, you can see that gid is 3000 which is same as the runAsGroup field
- If the runAsGroup was omitted, the gid would remain as 0 (root) and the process will be able to interact with files that are owned by the root(0) group and groups that have the required group permissions for the root (0) group.
- Exit your shell:
```
exit
```

## Clean up
```
kubectl delete pod security-context-demo
```
