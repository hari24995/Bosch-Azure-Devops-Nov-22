# Security Context
# - In Kubernetes, a securityContext defines privilege and access control settings for a Pod or Container

## Set the security context for a Pod
kubectl apply -f kube-manifests/security-context.yaml

## Verify that the Pod's Container is running:
kubectl get pod security-context-demo

## Get a shell to the running Container:
kubectl exec -it security-context-demo -- sh

## In your shell, list the running processes:
ps

# The output shows that the processes are running as user 1000, which is the value of runAsUser

# In your shell, navigate to /data, and list the one directory
cd /data
ls -l

# The output shows that the /data/demo directory has group ID 2000, which is the value of fsGroup.
# In your shell, navigate to /data/demo, and create a file:
cd demo
echo hello > testfile

# List the file in the /data/demo directory:
ls -l

# The output shows that testfile has group ID 2000, which is the value of fsGroup.
# Run the following command:
id

# The output is similar to this:
## uid=1000 gid=3000 groups=2000

# From the output, you can see that gid is 3000 which is same as the runAsGroup field
# If the runAsGroup was omitted, the gid would remain as 0 (root) and the process will be able to interact with files that are owned by the root(0) group and groups that have the required group permissions for the root (0) group.
# Exit your shell:
exit

## Clean up
kubectl delete pod security-context-demo
