# Kubernetes - Requests and Limits

# Create All Objects
kubectl apply -f kube-manifests/


# List Pods
kubectl get pods


# List Services
PUBLIC_IP=$(kubectl get svc app1-nginx-clusterip-service -o json | jq .status.loadBalancer.ingress[0].ip)
PUBLIC_IP2=${PUBLIC_IP//\"}
echo $PUBLIC_IP2


# Access Application
echo "curl http://$PUBLIC_IP2/app1/index.html"
curl http://$PUBLIC_IP2/app1/index.html

# Delete All
kubectl delete -f kube-manifests/
