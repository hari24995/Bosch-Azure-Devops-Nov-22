source ~/python_venv/bin/activate

# init terraform's Azure provider (main.tf)
terraform init

terraform validate

terraform plan

# deploy terraform infra
terraform apply -auto-approve
