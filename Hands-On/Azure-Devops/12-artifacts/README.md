# DevOps Artifacts
## Integrate to pull from Python PIP
### Install artifacts-keyring
```
source ~/python_venv/bin/activate
pip install keyring artifacts-keyring
pip install twine
```

### Install SDK
```
sudo apt update
```

```
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update; sudo apt install -y apt-transport-https && sudo apt update && sudo apt install -y dotnet-sdk-6.0
```

### Installing packages from an Azure Artifacts feed
```
pip install pandas --index-url https://pkgs.dev.azure.com/u10352/learning/_packaging/atin-devops-artifacts-feed/pypi/simple/
```

## Push artifacts
twine upload --repository-url https://pkgs.dev.azure.com/u10352/learning/_packaging/atin-devops-artifacts-feed/pypi/upload <package_wheel_or_other_dist_format>

## Push artifacts from Pipelines
