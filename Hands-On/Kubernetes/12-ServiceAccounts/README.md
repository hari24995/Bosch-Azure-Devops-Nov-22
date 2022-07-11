# Kubernetes Service Accounts
## Let’s consider the following scenario
- You have deployments/pods in a namespace called webapps
- The deployments/pods need Kubernetes API access to manage resources in a namespace.

## Solution
- Have a service account with roles with specific API access.

## Steps
- Create a service account bound to the namespace webapps namespace
- Create a role with the list of required API access to Kubernetes resoruces.
- Create a Rolebinding to bind the role to the service account.
- Use the service account in the pod/deployment or Kubernetes Cronjobs

## Create webapps Namespace
- For the purpose of demonstration, we will create a namespace called webapps
```
kubectl create namespace webapps
```

## Create Kubernetes Service Account
- Let’s create a service account named app-service-account that bounds to webapps namespace
```
kubectl apply -f kube-manifests/service-account.yaml
```

## Create a Role For API Access
- In the kubernetes Role, we specify the list of API access required for Kubernetes resources.
- Lets create a role named app-role specific to webapps namespace.
```
kubectl apply -f kube-manifests/role.yaml
kubectl get roles -n webapps
```

## Create a Rolebinding [ Attaching Role to ServiceAccount]
- Now we have a service account and a role which has no relation.
- With Rolebinding we attach the role to the service account. So the pods which use the service account in webapps namespace will have all the access mentioned in the app-role

```
kubectl apply -f kube-manifests/role-binding.yaml
```

## Validate Kubernetes Role Permissions
- We will use the bibinwilson/docker-kubectl Docker image that I have created with the kubectl utility.
- Let’s deploy a pod named debug with bibinwilson/docker-kubectl image and our service account app-service-account.
```
kubectl apply -f kube-manifests/pod.yaml
```

- Lets exec in to the debug pod and see if has the privileges we mentioned in the role.
```
kubectl exec -it debug /bin/bash -n webapps
```

- Now, you should be able to list pods and other resources in webapps namespace. You cannot list the pods in other namespaces are this role is specific to webapps namespace.

## Cleanup
kubectl delete -f kube-manifests/
kubectl delete ns webapps
