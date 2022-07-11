AKS_NAME="aksatinnp"
AKS_RG="rgaksatinnp"
mylocation="eastus2"

az group create --name $AKS_RG --location $mylocation

az aks create --resource-group $AKS_RG --name $AKS_NAME --node-count 1  --load-balancer-sku basic --node-vm-size Standard_B2s --network-plugin azure --network-policy calico  --enable-managed-identity  --generate-ssh-keys --location $mylocation

az aks get-credentials --resource-group $AKS_RG --name $AKS_NAME

sudo snap install kubectl --classic
kubectl get nodes -o wide


# List Namespaces
kubectl get namespaces
