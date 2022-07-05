# Kubernetes - Secrets

# Linux
echo -n 'dbpassword11' | base64
# URL: https://www.base64encode.org

# Create All Objects
kubectl apply -f kube-manifests/


# List Pods
kubectl get pods


# Get Public IP of Application
kubectl get svc


# Access Application
curl http://<External-IP-from-get-service-output>
#Username: admin101
#Password: password101


## Step-06: Clean-Up
- Delete all k8s objects created as part of this section

# Delete All
kubectl delete -f kube-manifests/


# List Pods
kubectl get pods


# Verify sc, pvc, pv
kubectl get sc,pvc,pv
