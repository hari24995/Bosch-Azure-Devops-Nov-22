# Ingress - Context Path Based Routing

## Introduction
![image info](./resources/ingress-context-path.png)

## Deploy and Verify
```
# Deploy Apps
kubectl apply -R -f kube-manifests/

# List Pods
kubectl get pods

# List Services
kubectl get svc

# List Ingress
kubectl get ingress
```

## Access Applications
```
# Access App1
http://<Public-IP-created-for-Ingress>/app1/index.html

# Access App2
http://<Public-IP-created-for-Ingress>/app2/index.html

# Access Usermgmt Web App
http://<Public-IP-created-for-Ingress>
Username: admin101
Password: password101
```

## Clean-Up Applications
```
# Delete Apps
kubectl delete -f kube-manifests/
```

# Delete Azure Disk created for Usermgmt Web App
## Go to All Services -> Azure Disks -> Delete disk
