## Introduction
- The state is stored by default in a local file named `terraform.tfstate`, but it can also be stored remotely, which works better in a team environment.
- Create Azure Storage Account to store `terraform.tfstate` file and enable backend configurations in terraform settings block


## Create Azure Storage Account
### Create Resource Group
- Go to Resource Groups -> Add
- **Resource Group:** terraform-storage-rg
- **Region:** East US
- Click on **Review + Create**
- Click on **Create**

### Create Azure Storage Account
- Go to Storage Accounts -> Add
- **Resource Group:** terraform-storage-rg
- **Storage Account Name:** terraformstate201 (THIS NAME SHOULD BE UNIQUE ACROSS AZURE CLOUD)
- **Region:** East US
- Click on **Review + Create**
- Click on **Create**

### Create Container in Azure Storage Account
- Go to Storage Account -> `terraformstate201` -> Containers -> `+Container`
- **Name:** tfstatefiles
- Click on **Create**


## Step-03: Terraform Backend Configuration
- Add the below listed Terraform backend block in `Terrafrom Settings` block in `c1-versions.tf`
```t
# Terraform State Storage to Azure Storage Container
  backend "azurerm" {
    resource_group_name   = "terraform-storage-rg"
    storage_account_name  = "terraformstate201"
    container_name        = "tfstatefiles"
    key                   = "terraform.tfstate"
  }
```

## Test with Remote State Storage Backend
```t
# Initialize Terraform
terraform init

# Review the terraform plan
terraform plan

# Create Resources
terraform apply -auto-approve
```

## Destroy Resources
- Destroy Resources and Verify Storage Account `terraform.tfsate` file Versioning
```t
# Destroy Resources
terraform destroy -auto-approve
