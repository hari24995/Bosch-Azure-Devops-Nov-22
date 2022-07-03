## Introduction
- We will build a Terraform module to host a static website on Azure Storage Account.
- We will understand how to call a Local Re-usable module in to a Root Module.

## Create Module Folder Structure
- We are going to create `modules` folder and in that we are going to create a module named `azure-static-website`

### modules
- Module-1: terraform-manifests/modules/azure-static-website
1. main.tf
2. variables.tf
3. outputs.tf
4. README.md
5. LICENSE

## Root Module
- Call Module from Terraform Work Directory

## c3-static-website.tf
- Arguments for this module are going to be the variables defined in `variables.tf` of module
```t
# Call our Custom Terraform Module which we built earlier
module "azure_static_website" {
  source = "./modules/azure-static-website"  # Mandatory

  # Resource Group
  location = "eastus"
  resource_group_name = "myrg1"

  # Storage Account
  storage_account_name = "staticwebsite"
  storage_account_tier = "Standard"
  storage_account_replication_type = "LRS"
  storage_account_kind = "StorageV2"
  static_website_index_document = "index.html"
  static_website_error_404_document = "error.html"
}
```

## Execute Terraform Commands
```t
# Terraform Initialize
terraform init

# Terraform Plan
terraform plan

# Terraform Apply
terraform apply -auto-approve

# Upload Static Content
1. Go to Storage Accounts -> staticwebsitexxxxxx -> Containers -> $web
2. Upload files from folder "static-content"

# Verify
1. Azure Storage Account created
2. Static Website Setting enabled
3. Verify the Static Content Upload Successful
4. Access Static Website: Goto Storage Account -> staticwebsitek123 -> Data Management -> Static Website
5. Get the endpoint name `Primary endpoint`
https://staticwebsitek123.z13.web.core.windows.net/
```

## Step-08: Destroy and Clean-Up
```t
# Terraform Destroy
terraform destroy -auto-approve
```
