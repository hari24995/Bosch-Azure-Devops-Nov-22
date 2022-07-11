kubectl apply -f kube-manifests/multi-pod.yaml

kubectl get pods

kubectl expose pod mc1  --type=LoadBalancer --port=80 --name=multi-pod-service

POD_PUBLIC_IP=$(kubectl get svc multi-pod-service -o json | jq .status.loadBalancer.ingress[0].ip)
POD_PUBLIC_IP2=${POD_PUBLIC_IP//\"}

echo http://$POD_PUBLIC_IP2
curl http://$POD_PUBLIC_IP2

kubectl delete -f kube-manifests/multi-pod.yaml
kubectl delete svc multi-pod-service

#-----------------------------
# This example defines a simple Pod that has two init containers
# The first waits for myservice, and the second waits for mydb
# Once both init containers complete, the Pod runs the app container from its spec section.

kubectl apply -f kube-manifests/multi-pod-init.yaml
kubectl get pods
kubectl logs -f init-demo

kubectl logs init-demo -c install
kubectl logs init-demo -c nginx

kubectl expose pod init-demo  --type=LoadBalancer --port=80 --name=init-pod-service

kubectl get svc init-pod-service

POD_PUBLIC_IP=$(kubectl get svc init-pod-service -o json | jq .status.loadBalancer.ingress[0].ip)
POD_PUBLIC_IP2=${POD_PUBLIC_IP//\"}


echo http://$POD_PUBLIC_IP2
curl http://$POD_PUBLIC_IP2

kubectl delete -f kube-manifests/multi-pod-init.yaml
kubectl delete svc init-pod-service
