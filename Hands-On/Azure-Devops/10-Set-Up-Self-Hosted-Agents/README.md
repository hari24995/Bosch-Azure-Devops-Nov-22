# Self Hosted Agent Pool on Ubuntu 18.0.4 LTS
## Install Oracle Java
```
cd
sudo apt update
sudo apt install default-jdk
java -version
```

```
sudo apt install -y maven
sudo apt install -y git
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```

## Install Agent
### Generate PAT from Azure DevOps. Below is sample PAT:
```
omvjapbbld3lohkyb5lsq36az5sn5zwb3eh2j4jyve2kbu3c7zsa
```

### Install Agent
```
mkdir ~/myagent && cd ~/myagent
wget https://vstsagentpackage.azureedge.net/agent/2.204.0/vsts-agent-linux-x64-2.204.0.tar.gz
tar zxvf vsts-agent-linux-x64-2.204.0.tar.gz
rm -rf zxvf vsts-agent-linux-x64-2.204.0.tar.gz
```

### Configure Agent
```
./config.sh
```

### Run Agent
```
./run.sh
```

# Self Hosted Agent Pool on Windows Server 2019 Datacenter
## Install Necessary Binaries
```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

```
choco feature enable -n=allowGlobalConfirmation
```

```
choco install powershell-core
choco install dotnet-sdk --pre
choco install dotnetcore-sdk
choco install azure-cli
choco install visualstudio2019community
```
- Now open Visual Studio and open the project which we need to build using pipeline so that it can install necessary packages as required

## Install Agent
```
mkdir c:\agent ; cd c:\agent
$url = "https://vstsagentpackage.azureedge.net/agent/2.204.0/vsts-agent-win-x64-2.204.0.zip"
$dest = "c:\agent\vsts-agent-win-x64-2.204.0.zip"
Invoke-WebRequest -Uri $url -OutFile $dest
Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory("$PWD\vsts-agent-win-x64-2.204.0.zip", "$PWD")
```

## Configure Agent
```
.\config.cmd
```

## Start Agent
```
.\run.cmd
```
