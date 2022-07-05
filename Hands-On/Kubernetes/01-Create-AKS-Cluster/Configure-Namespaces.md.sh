AKS_NAME = "aks-test"
AKS_RG = "rgaks"

#- Login to Azure (If Required)
az login
az account set --subscription "SUBSCRIPTION_ID"

#- Connect to AKS (If Required)
az aks get-credentials --resource-group $AKS_RG --name $AKS_NAME

# Change context to AKS cluster
kubectl config use-context $AKS_NAME

# Get all my pods
kubectl get pods
