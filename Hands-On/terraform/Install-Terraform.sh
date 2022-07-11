# Install Terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update && sudo apt install terraform

# Plugin Caching on Ubuntu
mkdir -p /tmp/.terraform.d/plugin-cache
touch ~/.terraformrc
cat ~/.terraformrc
echo 'plugin_cache_dir   = "/tmp/.terraform.d/plugin-cache"' > ~/.terraformrc
cat ~/.terraformrc

# Confirm installation
terraform -help
terraform version
terraform -install-autocomplete

# Configure Terraform
## Login to Azure CLI
az login --use-device-code
az account list
az account set --subscription="SUBSCRIPTION_ID"
