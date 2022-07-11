# How to Import an Existing Azure Resource in Terraform
- This allows us to use resources that we have created by some other means and bring it under Terraform management.

- Note: Terraform import can only import resources into the state. It does not generate configuration.

## Activate Python Env for Azure CLI
```
source ~/python_venv/bin/activate
```

## Get resource ID
```
RG_TO_IMPORT_NAME="rg458523"
RG_TO_IMPORT_ID=$(az group show --name $RG_TO_IMPORT_NAME --query id --output tsv)
echo $RG_TO_IMPORT_ID
```

## Create the file which has the code for the resource to be imported
# Refer terraform-manifests/c2-resource-group.tf
```
resource "azurerm_resource_group" "myrg" {}
```

## Initialize Terraform:
```
terraform init
```

## Finally Import the resource
```
terraform import azurerm_resource_group.myrg $RG_TO_IMPORT_ID
```

Edit the Terraform file import.tf and add the name and location of the existing resource to the Resource Group:
```
resource "azurerm_resource_group" "myrg" {
  name     = "rg458523"
  location = "East US"
}
```

## Create a new VNET called import-vnet inside the my-vnet resource group.
```
resource "azurerm_virtual_network" "my-vnet" {
  name = "my-vnet"
  location = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  address_space = ["10.10.65.0/24"]
}
```

## Now we run the code:
```
terraform apply -auto-approve
```

## The new vnet, located on the existing resource group, ready!
