source "azure-arm" "my-example" {
  client_id = "${var.client_id}"
  client_secret = "${var.client_secret}"


  tenant_id= "${var.tenant_id}"
  subscription_id = "${var.subscription_id}"

  managed_image_resource_group_name = "packerdemo"
  managed_image_name = "myPackerImage"

  os_type = "Linux"
  image_publisher = "Canonical"
  image_offer = "UbuntuServer"
  image_sku = "${var.image_sku}"

  location = "East US"
  vm_size = "Standard_DS2_v2"

  azure_tags = {
    dept = "engineering"
  }
}

build {
  sources = ["sources.azure-arm.my-example"]
  provisioner "shell" {
    inline = ["export DEBIAN_FRONTEND=noninteractive",
    "DEBIAN_FRONTEND=noninteractive sudo apt update",
    "DEBIAN_FRONTEND=noninteractive sudo apt install -y nginx"]
  }
}
