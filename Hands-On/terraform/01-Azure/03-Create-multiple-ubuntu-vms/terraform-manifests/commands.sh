source ~/python_venv/bin/activate

# init terraform's Azure provider (main.tf)
terraform init

# deploy terraform infra
terraform apply -auto-approve

chmod 400 ./ssh-keys/*

ssh -i ssh-keys/terraform-azure.pem azureuser@<vn-dns-name>

# destroy infra
terraform destroy -auto-approve
