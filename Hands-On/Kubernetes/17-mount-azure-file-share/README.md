# Mount an Azure Storage File Share to containers in Azure Kubernetes Services (AKS)
- How to share a mounted Azure file share across multiple containers in your deployments in Microsoft's hosted Kubernetes offering, AKS.

## Create the Azure File share
- In the Azure Portal, navigate to your desired Storage Account and create File Share

## Grab the connection details
- In the Azure Portal, go to the Access Keys section of your Storage Account and find the details here

## Base64 encode the connection details for use in the Kubernetes Secret
- You can Base64 encode things with code, PowerShell, online websites*, and many other ways.
- Replace with your values. Mind the UTF8 encoding.
```
$accountName = "blogdemostorageaccount"
$accountNameBytes = [System.Text.Encoding]::UTF8.GetBytes($accountName)
$accountNameBase64 = [Convert]::ToBase64String($accountNameBytes)
Write-Host "Account Name Base 64: " $accountNameBase64

$accountKey = "FAKEyJ90HmAbQY4tR1SPxRGFAKEqdE8GEchJHBAKyGRlNywDKWeVM9QxsaoRqFAKSE=="
$accountKeyBytes = [System.Text.Encoding]::UTF8.GetBytes($accountKey)
$accountKeyBase64 = [Convert]::ToBase64String($accountKeyBytes)
Write-Host "Account Name Key 64: " $accountKeyBase64
```

## Define and Deploy to Kubernetes in AKS (If not already done)

## Create a Kubernetes Secret with the Azure Storage connection data
- Refer: kube-manifests/secret-sauce.yaml

## Replace Base64 encoded values
```
sed
```

## Create the secret in the cluster:
```
kubectl apply -f secret-sauce.yaml
```

## Verify that the secret exists
```
kubectl get secret storage-secret
```

## Create Kubernetes Deployment and define the volume mounts
- Refer: kube-manifests/deployment.yaml


### volumeMounts
  - Here we specify the path we want to mount the file share inside the container.

### volumes
  - Define the azureFile entry with the secret name
  - This is the secret we created in an earlier step
  - The share name myawesomefileshare refers to the actual Azure File share we created in an earlier step.

## Verify volume mounts in the Kubernetes Deployment
```
kubectl get deploy -o json
kubectl get pod
kubectl describe pod deployment-azurestorage-test-68b78cd79-l6grt
```
