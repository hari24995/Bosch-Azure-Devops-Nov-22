# Install Helm3 (if not installed)
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
helm version


## Add Helm Repo
# Refer: https://github.com/bitnami/charts
helm repo add bitnami https://charts.bitnami.com/bitnami
helm search repo bitnami

## Commands to install NGINX from existing Helm Chart
helm repo update
helm search repo nginx
helm install nginx bitnami/nginx
kubectl get all
helm list
helm uninstall nginx
helm status nginx

## Create new Helm Chart
helm create buildachart
ls buildachart/
#nano buildachart/Chart.yaml
ls buildachart/templates/
helm install my-cherry-chart buildachart/ --values buildachart/values.yaml  --set service.type=LoadBalancer
helm uninstall my-cherry-chart
helm package buildachart
ll
helm install example3 buildachart-0.1.0.tgz --set service.type=LoadBalancer
helm uninstall example3
