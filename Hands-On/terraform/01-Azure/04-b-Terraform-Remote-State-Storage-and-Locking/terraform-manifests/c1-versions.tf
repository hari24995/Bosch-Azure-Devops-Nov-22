# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0"
    }
    random = {
      source = "hashicorp/random"
      version = ">= 3.0"
    }
  }
# Terraform State Storage to Azure Storage Container
  backend "azurerm" {
    resource_group_name   = "rgtfstate"
    storage_account_name  = "tfsttbscmysaname"
    container_name        = "tfstatefiles"
    key                   = "terraform.tfstate"
  }
}

# Provider Block
provider "azurerm" {
 features {}
}

# Random String Resource
resource "random_string" "myrandom" {
  length = 6
  upper = false
  special = false
  number = false
}
