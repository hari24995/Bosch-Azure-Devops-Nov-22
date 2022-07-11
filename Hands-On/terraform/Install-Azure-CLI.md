# Install the Azure CLI on Windows
```
https://aka.ms/installazurecliwindows
```

# Install using python PIP (Recommended)
sudo apt install -y python3-virtualenv
virtualenv ~/python_venv
source ~/python_venv/bin/activate
pip install azure-cli


# Install the Azure CLI on Linux using Script (Not Recommended)
```
curl -L https://aka.ms/InstallAzureCli | bash
```

- Reload your shell's command cache.
```
hash -r
exit
```

- Login
```
az login --use-device-code
```

- Verify login
```
az account list
az account set --subscription="SUBSCRIPTION_ID"
```


## Uninstall (Optional)
```
rm -r $HOME/lib/azure-cli
rm $HOME/bin/az
rm -rf ~/.azure
```
- Modify your $HOME/.bash_profile file to remove the following line:
```
$HOME/lib/azure-cli/az.completion
```
