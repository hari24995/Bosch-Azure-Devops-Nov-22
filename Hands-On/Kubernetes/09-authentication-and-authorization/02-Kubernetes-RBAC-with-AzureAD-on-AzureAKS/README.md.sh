# Kubernetes RBAC Role & Role Binding with Azure AD on AKS

## Create a Namespace Dev, QA and Deploy Sample Application

# Configure Command Line Credentials for kubectl
AKS_NAME="aksatin"
AKS_RG="rgaksatin"
az aks get-credentials --resource-group $AKS_RG --name $AKS_NAME --admin --overwrite-existing

# View Cluster Info
kubectl cluster-info


# Create Namespaces dev and qa
kubectl create namespace dev


kubectl create namespace qa

# Deploy Sample Application
kubectl apply -f kube-manifests/01-Sample-Application -n dev


kubectl apply -f kube-manifests/01-Sample-Application -n qa


# Access Dev Application
kubectl get svc app1-nginx-service -n dev
DEV_PUBLIC_IP=$(kubectl get svc app1-nginx-service -n dev -o json | jq .status.loadBalancer.ingress[0].ip)
DEV_PUBLIC_IP2=${DEV_PUBLIC_IP//\"}
echo $DEV_PUBLIC_IP2

echo http://$DEV_PUBLIC_IP2/app1/index.html
curl http://$DEV_PUBLIC_IP2/app1/index.html


# Access QA Application
kubectl get svc -n qa
QA_PUBLIC_IP=$(kubectl get svc app1-nginx-service -n qa -o json | jq .status.loadBalancer.ingress[0].ip)
QA_PUBLIC_IP2=${DEV_PUBLIC_IP//\"}
echo $QA_PUBLIC_IP2


echo http://$QA_PUBLIC_IP2/app1/index.html
curl http://$QA_PUBLIC_IP2/app1/index.html


## Create AD Group, Role Assignment and User for Dev
# Get Azure AKS Cluster Id
AKS_CLUSTER_ID=$(az aks show --resource-group $AKS_RG --name $AKS_NAME --query id -o tsv)

echo $AKS_CLUSTER_ID

# Create Azure AD Group
az ad group create --display-name "$USER-devaksteam" --mail-nickname "$USER-devaksteam"
DEV_AKS_TEAM_GRP_ID=$(az ad group show -g "$USER-devaksteam" -o json | jq .id)
DEV_AKS_TEAM_GRP_ID2=${DEV_AKS_TEAM_GRP_ID//\"}
echo $DEV_AKS_TEAM_GRP_ID2

# Create Role Assignment: Give
az role assignment create --assignee $DEV_AKS_TEAM_GRP_ID2 --role "Azure Kubernetes Service Cluster User Role" --scope $AKS_CLUSTER_ID

# Create Dev User
az ad user create --display-name "$USER-AKS Dev1" --user-principal-name "$USER-aksdev1@ag9465462gmail.onmicrosoft.com" --password @AKSDemo123

DEV_AKS_USER_OBJECT_ID=$(az ad user show --id "$USER-aksdev1@ag9465462gmail.onmicrosoft.com" -o json | jq .id)
DEV_AKS_USER_OBJECT_ID2=${DEV_AKS_USER_OBJECT_ID//\"}
echo $DEV_AKS_USER_OBJECT_ID2


# Associate Dev User to Dev AKS Group
az ad group member add --group "$USER-devaksteam" --member-id $DEV_AKS_USER_OBJECT_ID2

## Review Kubernetes RBAC Role & Role Binding
# Get Object ID for AD Group devaksteam
az ad group show --group "$USER-devaksteam" --query id -o tsv
DEV_AKS_TEAM_ID=$(az ad group show --group "$USER-devaksteam" --query id -o tsv)
DEV_AKS_TEAM_ID2=${DEV_AKS_TEAM_ID//\"}
echo $DEV_AKS_TEAM_ID2

### Review & Update Kubernetes RBAC Role Binding for Dev Namespace
#- Update Azure AD Group **devaksteam** Object ID in Role Binding
#- **File Name:** rolebinding-dev-namespace.yaml
sed -i "s/4123d819-9ed6-460b-8321-39f02157536b/$DEV_AKS_TEAM_ID2/g" kube-manifests/02-Roles-and-RoleBindings/rolebinding-dev-namespace.yaml

## Create Kubernetes RBAC Role & Role Binding for Dev Namespace
# As AKS Cluster Admin (--admin)
az aks get-credentials --resource-group $AKS_RG --name $AKS_NAME --overwrite-existing --admin


# Create Kubernetes Role and Role Binding
kubectl apply -f kube-manifests/02-Roles-and-RoleBindings


# Verify Role and Role Binding
kubectl get role -n dev


kubectl get rolebinding -n dev


## Access Dev Namespace using $USER-aksdev1@ag9465462gmail.onmicrosoft.com AD User

# Overwrite kubectl credentials
az aks get-credentials --resource-group $AKS_RG --name $AKS_NAME --overwrite-existing


# List Pods
kubectl get pods -n dev


- URL: https://microsoft.com/devicelogin
- Code: GLUQPEQ2N (Sample)(View on terminal)
- Username: $USER-aksdev1@ag9465462gmail.onmicrosoft.com
- Password: @AKSDemo123


# List Services from Dev Namespace
kubectl get svc -n dev


# List Services from QA Namespace
kubectl get svc -n qa


# Forbidden Message should come when we list QA Namespace resources
Error from server (Forbidden): services is forbidden: User "$USER-aksdev1@ag9465462gmail.onmicrosoft.com" cannot list resource "services" in API group "" in the namespace "qa"


## Clean-Up
az aks get-credentials --resource-group $AKS_RG --name $AKS_NAME --overwrite-existing --admin

# Clean-Up Apps
kubectl delete ns dev


kubectl delete ns qa
