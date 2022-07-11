source ~/python_venv/bin/activate

## Create Azure Storage Account
sudo apt install gpw
SA_NAME_SUFFIX=$(gpw 1 13)
echo $SA_NAME_SUFFIX
az group create -l westus -n rg$USER
az storage account create -n $USER$SA_NAME_SUFFIX -g rg$USER -l westus --sku Standard_LRS

## Create File Share
shareName="myshare"
az storage share-rm create --resource-group rg$USER --storage-account $USER$SA_NAME_SUFFIX --name $shareName --access-tier "TransactionOptimized" --quota 1024 --output json

accountName=$USER$SA_NAME_SUFFIX
echo $accountName
accountNameBase64=`echo -n $accountName | base64`
echo $accountNameBase64

accountKey=$(az storage account keys list -g rg$USER -n $accountName -o json | jq .[0].value  | sed 's/"//g')
echo $accountKey
accountKeyBase64=`echo -n $accountKey | base64  | tr -d '\n'`
echo $accountKeyBase64

## Replace Base64 encoded values in the file
sed -i "s/azurestorageaccountname: Base64_Encoded_Value_Here/azurestorageaccountname: $accountNameBase64/g" kube-manifests/secret-sauce.yaml
sed -i "s/azurestorageaccountkey: Base64_Encoded_Value_Here/azurestorageaccountkey: $accountKeyBase64/g" kube-manifests/secret-sauce.yaml

## Create the secret in the cluster:
kubectl apply -f kube-manifests/secret-sauce.yaml

## Verify that the secret exists
kubectl get secret storage-secret

## Create Kubernetes Deployment and define the volume mounts
# - Refer: kube-manifests/deployment.yaml
kubectl apply -f kube-manifests/deployment.yaml

## Verify volume mounts in the Kubernetes Deployment
kubectl get pod
POD_NAME1=`kubectl get pod -o json | jq .items[0].metadata.name | sed 's/"//g'`
POD_NAME2=`kubectl get pod -o json | jq .items[1].metadata.name | sed 's/"//g'`
POD_NAME3=`kubectl get pod -o json | jq .items[2].metadata.name | sed 's/"//g'`
echo $POD_NAME1
echo $POD_NAME2
echo $POD_NAME3
kubectl logs $POD_NAME1
kubectl describe pod $POD_NAME1

kubectl exec -it $POD_NAME1 -- ls /myshare
kubectl exec -it $POD_NAME1  -- bash -c "echo $POD_NAME1 `date` >> /myshare/myfile.txt"
kubectl exec -it $POD_NAME1 -- cat /myshare/myfile.txt

kubectl exec -it $POD_NAME2  -- bash -c "echo $POD_NAME2 `date` >> /myshare/myfile.txt"
kubectl exec -it $POD_NAME2 -- cat /myshare/myfile.txt

kubectl exec -it $POD_NAME3  -- bash -c "echo $POD_NAME3 `date` >> /myshare/myfile.txt"
kubectl exec -it $POD_NAME3 -- cat /myshare/myfile.txt

kubectl exec -it $POD_NAME1  -- bash
cd /myshare
ls
cat myfile.txt

kubectl delete -f kube-manifests/
az storage account delete -n $USER$SA_NAME_SUFFIX -g rg$USER
