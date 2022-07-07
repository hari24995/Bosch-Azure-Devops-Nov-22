# Multi-Container Pods
- You can create a Pod that runs multiple containers at the same time
- The question often arises
  - Should I deploy my microservices stack to a single Pod with multiple containers, or should I create multiple Pods, each running a single microservice?
- The short answer is to operate a single microservice per Pod.
- So what’s the point of running multiple containers in a Pod then?
- There are two common use cases.
  - Sometimes, you’ll want to initialize your Pod by executing setup scripts, commands, or any other kind of preconfiguration procedure before the application container should start. This logic runs in a so-called init container.
  - Other times, you’ll want to provide helper functionality that runs alongside the application container to avoid the need to bake the logic into application code. For example, you may want to massage the log output produced by the application

## Init Containers
- Init containers provide initialization logic concerns to be run before the main application even starts.
- Init containers are always started before the main application containers
- If initialization logic fails and an init container produces an error, the whole Pod is restarted, causing all init containers to run again in sequential order.
- Refer: kube-manifests/multi-pod-init.yaml
```
kubectl apply -f kube-manifests/multi-pod-init.yaml
kubectl get pod business-app
kubectl get pod business-app
kubectl logs business-app -c configurer
kubectl delete -f kube-manifests/multi-pod-init.yaml
```
