source ~/python_venv/bin/activate

## Get resource ID
RG_TO_IMPORT_NAME="rg458523"
RG_TO_IMPORT_ID=$(az group show --name $RG_TO_IMPORT_NAME --query id --output tsv)
echo $RG_TO_IMPORT_ID

## Create the file which has the code for the resource to be imported/
# Refer terraform-manifests/c2-resource-group.tf

## Initialize Terraform:
terraform init

## Finally Import the resource
echo $RG_TO_IMPORT_ID
cat terraform.tfstate
terraform import azurerm_resource_group.myrg $RG_TO_IMPORT_ID

## Check the terraform.tfstate
cat terraform.tfstate

# Edit the Terraform file import.tf and add the name and location of the existing resource to the Resource Group.
#resource "azurerm_resource_group" "myrg" {
#  name     = "rg458523"
#  location = "East US"
#}


## Create a new VNET called import-vnet inside the myrg resource group.
# - Refer c3-vnet.tf

## Now we run the code:
terraform apply -auto-approve

## The new vnet, located on the existing resource group, ready!
