# Azure AD Authentication for AKS Cluster Admins

# Verify Nodes
kubectl get nodes -o wide


# Get Cluster Information
kubectl cluster-info


## Introduction
#- We can use Azure AD Users and Groups to Manage AKS Clusters
#- We can create Admin Users in Azure AD and Associate to Azure AD Group named `k8sadmins` and those users can access Azure AKS Cluster using kubectl.

## Create Azure AD Group and User in Azure AD

## Enable AKS Cluster with AKS-managed Azure Active Directory feature
- Go to All Services -> Kubernetes Services -> aksdemo3 -> Settings -> Cluster Configuration
- **AKS-managed Azure Active Directory:** Select **Enabled** radio button
- **Admin Azure AD groups:** k8sadmins
- Click on **SAVE**

# Configure kubectl
AKS_NAME="aksatin"
AKS_RG="rgaksatin"
az aks get-credentials --resource-group $AKS_RG --name $AKS_NAME --overwrite-existing

# View Cluster Information
kubectl cluster-info

# List Nodes
kubectl get nodes


# List Pods
kubectl get pods -n kube-system


# List Everything
kubectl get all --all-namespaces


## How to bypass or Override AD Authentication and use k8s admin?
#- If we have issues with AD Users or Groups and want to override that we can use **--admin** to override and directly connect to AKS Cluster

az aks get-credentials --resource-group $AKS_RG --name $AKS_NAME --admin


# List Nodes
kubectl get nodes


# List Pods
kubectl get pods -n kube-system
