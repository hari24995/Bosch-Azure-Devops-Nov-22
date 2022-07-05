# Deployments with YAML
# Create Deployment
kubectl apply -f kube-manifests/02-deployment-definition.yml

kubectl get deploy


kubectl get rs


kubectl get po


# Create LoadBalancer Service
kubectl apply -f kube-manifests/03-deployment-LoadBalancer-service.yml


# List Service
kubectl get svc


# Access Application
curl http://<Load-Balancer-Service-IP>
