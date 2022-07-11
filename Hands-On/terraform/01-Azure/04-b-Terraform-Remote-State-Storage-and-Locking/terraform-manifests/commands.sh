source ~/python_venv/bin/activate

# init terraform's Azure provider (main.tf)
terraform init

export sa_name="tfsttbscgolwob"

echo $sa_name

sed -i "s/tfsttbscmysaname/$sa_name/g" c1-versions.tf

cat c1-versions.tf

# deploy terraform infra
terraform apply -auto-approve

chmod 400 ./ssh-keys/*

ssh -i ssh-keys/terraform-azure.pem azureuser@<vn-dns-name>

# destroy infra
terraform destroy -auto-approve
