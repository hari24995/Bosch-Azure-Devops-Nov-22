## Create webapps Namespace
kubectl create namespace webapps

## Create Kubernetes Service Account
kubectl apply -f kube-manifests/service-account.yaml

## Create a Role For API Access
kubectl apply -f kube-manifests/role.yaml
kubectl get roles -n webapps

## Create a Rolebinding [ Attaching Role to ServiceAccount]
kubectl apply -f kube-manifests/role-binding.yaml

## Validate Kubernetes Role Permissions
kubectl apply -f kube-manifests/pod.yaml

kubectl get pods -n webapps

# exec in to the debug pod and see if has the privileges we mentioned in the role.
kubectl exec -it debug /bin/bash -n webapps

# Now, you should be able to list pods and other resources in webapps namespace. You cannot list the pods in other namespaces are this role is specific to webapps namespace.
kubectl get pods -n webapps
kubectl get cronjobs -n webapps # Error
exit

# Cleanup
kubectl delete -f kube-manifests/
kubectl delete ns webapps
