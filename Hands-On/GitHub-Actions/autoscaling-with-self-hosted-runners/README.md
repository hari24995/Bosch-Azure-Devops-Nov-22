#	Autoscaling with self-hosted runners
## Connect to AKS
```
AKS_NAME="aks"
AKS_RG="rgakskh"
az login --use-device-code
az account list
az account set --subscription "SUBSCRIPTION_ID"
#- Connect to AKS (If Required)
az aks get-credentials --resource-group $AKS_RG --name $AKS_NAME --admin --overwrite-existing
```

## Install Helm
```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
helm version
```

## Add Helm Repo
helm repo add bitnami https://charts.bitnami.com/bitnami
helm search repo bitnami

## Commands to install NGINX from existing Helm Chart
```
helm repo update
helm search repo nginx
```


## Installation of cert-manager
- cert-manager is a required component needed by the actions-runner-controller for certificate management of Admission Webhook.
```
# Add repository
helm repo add jetstack https://charts.jetstack.io
helm repo update
# Install chart
helm install --wait --create-namespace --namespace cert-manager cert-manager jetstack/cert-manager --version v1.3.0 --set installCRDs=true
# Verify installation
kubectl --namespace cert-manager get all
```

## GitHub Personal Access Token
- Next, we need to create a Personal Access Token (PAT) which will be used by the controller to register self-hosted runners to GitHub Actions.
  - Login to GitHub account and navigate to https://github.com/settings/tokens
  - Click on Generate new token button
  - Select repo (Full Control) scope.
  - Click Generate Token

## Now, store the access token in a YAML file called custom-values.yaml
- Refer: kube-manifests/custom-values.yaml

## Installation of actions-runner-controller
- We’re now ready to install the controller using Helm.
```
# Add repository
helm repo add actions-runner-controller https://actions-runner-controller.github.io/actions-runner-controller
# Install chart
helm install -f kube-manifests/custom-values.yaml --wait --namespace actions-runner-system --create-namespace actions-runner-controller actions-runner-controller/actions-runner-controller
# Verify installation
kubectl --namespace actions-runner-system get all
```

## Deploy Self-Hosted Runner
- We now have everything in-place to deploy a self-hosted runner tied to a specific repository.
```
kubectl create namespace self-hosted-runners
kubectl --namespace self-hosted-runners apply -f kube-manifests/self-hosted-runner.yaml
kubectl --namespace self-hosted-runners get runner
kubectl --namespace self-hosted-runners get all
```

## View the registered runner
- Now, navigate to your repository Settings > Actions > Runner to view the registered runner.

## Trigger Workflow
- Now, navigate to the Github Repo and trigger workflow
  - https://github.com/atingupta2005/Bosch-github-actions-training/tree/autoscaling
- Note: Make sure the parameter in the workflow should be as below:
```
runs-on: self-hosted
```
