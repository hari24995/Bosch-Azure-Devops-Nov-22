# Deployments with YAML
# Create Deployment
kubectl apply -f kube-manifests/02-deployment-definition.yml

kubectl get deploy


kubectl get rs


kubectl get po


# Create LoadBalancer Service
kubectl apply -f kube-manifests/03-deployment-LoadBalancer-service.yml


# List Service
kubectl get svc deployment-loadbalancer-service

SVC_PUB_IP=$(kubectl get svc deployment-loadbalancer-service -o json | jq .status.loadBalancer.ingress[0].ip)
SVC_PUB_IP2=${SVC_PUB_IP//\"}
echo $SVC_PUB_IP2


# Access Application
curl $SVC_PUB_IP2
