# Kubernetes - Requests and Limits

# Create All Objects
kubectl apply -f kube-manifests-v1/


# List Pods
kubectl get pods


# List Services
kubectl get svc

# Access Application
curl http://<Public-IP-from-List-Services-Output>/app1/index.html

# Delete All
kubectl delete -f kube-manifests-v1/
