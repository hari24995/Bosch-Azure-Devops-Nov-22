curl -L https://aka.ms/InstallAzureCli | bash

exit

az login --use-device-code

az account list
az account set --subscription="SUBSCRIPTION_ID"
