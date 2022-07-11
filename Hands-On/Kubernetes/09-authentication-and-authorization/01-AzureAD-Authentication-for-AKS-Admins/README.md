# Azure AD Authentication for AKS Cluster Admins

## Introduction
- We can use Azure AD Users and Groups to Manage AKS Clusters
- We can create Admin Users in Azure AD and Associate to Azure AD Group named `k8sadmins` and those users can access Azure AKS Cluster using kubectl.

## Create Azure AD Group and User in Azure AD
### Create Azure AD Group
## Enable AKS Cluster with AKS-managed Azure Active Directory feature
- Go to All Services -> Kubernetes Services -> aksdemo3 -> Settings -> Configuration
- **AKS-managed Azure Active Directory:** Select **Enabled** radio button
- **Admin Azure AD groups:** k8sadmins
- Click on **SAVE**

## Access an Azure AD enabled AKS cluster using Azure AD User
```
# Configure kubectl
az aks get-credentials --resource-group aks-rg3 --name aksdemo3 --overwrite-existing
```
```
# View Cluster Information
kubectl cluster-info
```

```
# List Nodes
kubectl get nodes
```
```
# List Pods
kubectl get pods -n kube-system
```
```
# List Everything
kubectl get all --all-namespaces
```

## How to re-login with different user for kubectl ?
```
# Overwrite kubectl credentials
az aks get-credentials --resource-group aks-rg3 --name aksdemo3 --overwrite-existing
```
```
# View kubectl config (Observe aksdemo3 user)
kubectl config view
```
```
# List Nodes
kubectl get nodes
```

## How to bypass or Override AD Authentication and use k8s admin?
- If we have issues with AD Users or Groups and want to override that we can use **--admin** to override and directly connect to AKS Cluster
```
az aks get-credentials --resource-group aks-rg3 --name aksdemo3 --admin
```
```
# List Nodes
kubectl get nodes
```
```
# List Pods
kubectl get pods -n kube-system
```
