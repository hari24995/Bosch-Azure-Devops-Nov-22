# Remove Azure CLI (Optional)
sudo apt-get remove -y azure-cli
rm -rf ~/.azure

# Install using python PIP (Recommended)
## Note these steps are tested on Ubuntu 20.0.4 LTS
sudo apt install -y python3-virtualenv
virtualenv ~/python_venv
source ~/python_venv/bin/activate
pip install azure-cli

# Install using Script (Not recommended)
#curl -L https://aka.ms/InstallAzureCli | bash
#exit

# Login to Azure
az login --use-device-code

az account list
az account set --subscription="SUBSCRIPTION_ID"
