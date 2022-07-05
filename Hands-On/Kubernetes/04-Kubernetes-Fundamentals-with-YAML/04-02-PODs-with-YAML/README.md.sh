# PODs with YAML
# Create Pod
kubectl apply -f kube-manifests/02-pod-definition.yml

# List Pods
kubectl get pods

# Create Service
kubectl apply -f kube-manifests/03-pod-LoadBalancer-service.yml

# List Service
kubectl get svc


# Access Application
curl http://<Load-Balancer-Service-IP>
