kubectl apply -f kube-manifests/

kubectl get pods

kubectl exec -it myvolumes-pod -- sh
cd /tmp
touch myfile.txt
ls -al

exit

kubectl delete -f kube-manifests/
