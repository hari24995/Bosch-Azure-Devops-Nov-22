# Install Terraform

## For Linux - Ubuntu
```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

sudo apt update && sudo apt install terraform

```

## For Windows
 - https://releases.hashicorp.com/terraform/1.2.1/terraform_1.2.1_windows_amd64.zip

## Confirm installation
```
terraform -help
terraform version
terraform -install-autocomplete
```

## Configure Terraform on Windows
```
az login
az account list
az account set --subscription="SUBSCRIPTION_ID"
```

```
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}
```

# Configure the Microsoft Azure Provider
```
provider "azurerm" {
  features {}
  subscription_id = "00000000-0000-0000-0000-000000000000"
}
```
