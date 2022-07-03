# Install Terraform

## For Linux - Ubuntu
```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
```

```
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```

```
sudo apt update && sudo apt install terraform
```

### Plugin Caching on Ubuntu
```
mkdir -p /tmp/.terraform.d/plugin-cache
sudo  chmod -R a+rw /tmp/.terraform.d
touch ~/.terraformrc
cat ~/.terraformrc
echo 'plugin_cache_dir   = "/tmp/.terraform.d/plugin-cache"' > ~/.terraformrc
cat ~/.terraformrc
```

## For Windows
### Download Zip file and extract to C:/Windows
  - https://releases.hashicorp.com/terraform/1.2.1/terraform_1.2.1_windows_amd64.zip

### Confirm installation
```
terraform -help
terraform version
terraform -install-autocomplete
```

### Plugin Caching on Windows
- Open cmd
```
cmd
```

- Run below commands on cmd
```
md C:\\Temp
notepad %APPDATA%/terraform.rc
```

- Put below contents in notepad opened
```
plugin_cache_dir = "C:\\Temp\\.terraform.d\\plugin-cache"
```

- Close cmd
```
exit
```

## Configure Terraform
- Login to Azure CLI
```
az login --use-device-code
az account list
az account set --subscription="SUBSCRIPTION_ID"
```

### Specify Azure Provider in terraform files
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

### Optionally configure the Microsoft Azure Provider to specify the subscription to be used
```
provider "azurerm" {
  features {}
  subscription_id = "00000000-0000-0000-0000-000000000000"
}
```
