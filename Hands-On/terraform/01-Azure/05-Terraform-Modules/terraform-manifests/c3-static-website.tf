# Call our Custom Terraform Module which we built earlier

# Random String Resource
resource "random_string" "myrandom" {
  length = 4
  upper = false
  special = false
  number = false
}


module "azure_static_website" {
  source = "./modules/azure-static-website" # Mandatory

  # Resource Group
  location                          = "eastus"
  resource_group_name               = var.rg_name

  # Storage Account
  storage_account_name              = "${var.sa_name}${random_string.myrandom.id}"
  storage_account_tier              = "Standard"
  storage_account_replication_type  = "LRS"
  storage_account_kind              = "StorageV2"
  static_website_index_document     = "index.html"
  static_website_error_404_document = "error.html"
}
