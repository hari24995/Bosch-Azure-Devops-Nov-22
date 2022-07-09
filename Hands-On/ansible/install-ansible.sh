# Remove Azure CLI
sudo apt-get remove -y azure-cli
rm -rf ~/.azure

sudo apt remove -y ansible
sudo apt install -y python3-virtualenv
virtualenv ~/ansible_venv
source ~/ansible_venv/bin/activate
python --version
pip install --upgrade pip
pip install ansible[azure]
sudo apt install -y sshpass
pip install azure-cli
ansible --version
which ansible

az login --use-device-code
