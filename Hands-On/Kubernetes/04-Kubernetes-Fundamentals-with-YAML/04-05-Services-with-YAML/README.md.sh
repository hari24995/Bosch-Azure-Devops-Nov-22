# Services with YAML

## Introduction to Services
#- We are going to look in to below two services in detail with a frotnend and backend example
#  - LoadBalancer Service
#  - ClusterIP Service

## Create Backend Deployment & Cluster IP Service
kubectl get all
kubectl apply -f kube-manifests/01-backend-deployment.yml -f kube-manifests/02-backend-clusterip-service.yml
kubectl get all

## Create Frontend Deployment & LoadBalancer Service
kubectl apply -f kube-manifests/03-frontend-deployment.yml -f kube-manifests/04-frontend-LoadBalancer-service.yml
kubectl get all

# Get Service IP
kubectl get svc frontend-nginxapp-loadbalancer-service

SVC_PUB_IP=$(kubectl get svc frontend-nginxapp-loadbalancer-service -o json | jq .status.loadBalancer.ingress[0].ip)
SVC_PUB_IP2=${SVC_PUB_IP//\"}
echo $SVC_PUB_IP2

# Access REST Application
curl $SVC_PUB_IP2/hello

### Delete Objects (file by file)
kubectl delete -f kube-manifests/01-backend-deployment.yml -f kube-manifests/02-backend-clusterip-service.yml -f kube-manifests/03-frontend-deployment.yml -f kube-manifests/04-frontend-LoadBalancer-service.yml
kubectl get all

### Recreate Objects using YAML files in a folder
kubectl apply -f kube-manifests/  --validate=false
kubectl get all

### Delete Objects using YAML files in folder
kubectl delete -f kube-manifests/
kubectl get all
