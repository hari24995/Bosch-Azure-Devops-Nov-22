# Kubernetes Job
## How to Create a Kubernetes Job
kubectl apply -f kube-manifests/job.yaml
kubectl get jobs
kubectl get po
kubectl logs kubernetes-job-example* -f

## How to Create a Kubernetes CronJob
kubectl apply -f kube-manifests/cron-job.yaml
kubectl get cronjobs
