# Remove Azure CLI (If already there)
sudo apt-get remove -y azure-cli
rm -rf ~/.azure

# Remove Ansible (If already there)
sudo apt remove -y ansible

# Install Python Virtual env (If required)
sudo apt install -y python3-virtualenv

# Create Virtual Env (If required)
virtualenv ~/python_venv
source ~/python_venv/bin/activate
python --version

# Install Azure CLI (If Required)
pip install azure-cli
az login --use-device-code

# Install Ansible
source ~/python_venv/bin/activate
pip install --upgrade pip
pip install ansible[azure]
sudo apt install -y sshpass
ansible --version
which ansible
