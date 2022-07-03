# Terraform Useful Commands

## Terraform Validate
```bash
terraform validate     # validate the configuration for syntax validity
```

## Terraform Format
```bash
terraform fmt      # format the configuration files to standardize style
```

## Terraform Init
```bash
terraform init      # initialize terraform config files
```

## Terraform Plan
```bash
terraform plan     # pre-deployment plan

terraform plan -out=newplan    # save the plan to a file
```

## Terraform Apply
```bash
terraform apply    # prompt before creating resources described in terraform

terraform apply --auto-approve     # create resources without prompt

terraform apply "newplan"      # apply plan from plan file
```

## Terraform Destroy
```bash
terraform destroy
```

## Comments
```hcl
/*
resource "digitalocean_droplet" "my_droplet" {
    image = "ubuntu-18-04-x64"
    name = "web-1"
    region = "nyc1"
    size = "s-1vcpu-1gb"
}
*/
```
