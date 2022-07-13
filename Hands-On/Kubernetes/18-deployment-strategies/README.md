```
spec:
  minReadySeconds: 60
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 50%
      maxUnavailable: 50%
```

### minReadySeconds:
- The bootup time of your application, Kubernetes waits specific time until the next pod creation
- For example minReadySeconds is 60 then after the Pod become healthy the Deployment must wait for 60 seconds to update the next Pod.

### maxSurge:
- The maxSurge parameter controls how many extra resources can be created during the rollout.(Absolute value or %)

### maxUnavailable:
- The maxUnavailable parameter sets the maximum number of Pods that can be unavailable during a rolling update.(Absolute value or %)

```
spec:
  replicas: 3
  strategy:
        type: Recreate
  template:
  ...
```

### Deployment
```
~/Bosch-Azure-Devops-June-22/Hands-On/Kubernetes/18-deployment-strategies
kubectl apply -f kube-manifests/ --record
```

```
kubectl get svc nginx-loadbalancer-service
```

-- Curl using watch
```
watch -n 0.1 curl <public-ip>
```

- Update image name

```
kubectl replace -f kube-manifests/
```

```
watch <public-ip>
```

```
kubectl rollout status deployment rollingupdate-strategy
```

```
kubectl rollout history deployment/rollingupdate-strategy
```

```
kubectl rollout undo deployment/rollingupdate-strategy
```

```
kubectl rollout undo deployment rollingupdate-strategy --to-revision=2
```

```
kubectl rollout history deployment/rollingupdate-strategy
```
