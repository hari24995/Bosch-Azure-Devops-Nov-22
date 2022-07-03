## Introduction
- Understand Resource Meta-Argument `count`
- Also implement count and count index practically
- In general, 1 Azure VM Instance Resource in Terraform equals to 1 VM Instance in Real Azure Cloud
- 5 Azure VM Instance Resources = 5 Azure VM Instances in Azure Cloud
- With `Meta-Argument count` this is going to become super simple.

## Review Terraform Configs V2
- **Usecase:** Create two Azure Linux VMs using Meta-Argument `count`
1. We need two Public IPs for two VMs
2. We need two Network Interfaces two VMs

## terraform-manifests - c3-virtual-network.tf
- For Public IP resource add `count=2`
```t
# Create Azure Public IP Address
resource "azurerm_public_ip" "mypublicip" {
  count = 2
  name                = "mypublicip-${count.index}"
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  allocation_method   = "Static"
  domain_name_label = "app1-vm-${count.index}-${random_string.myrandom.id}"  
}
```

## terraform-manifests - c3-virtual-network.tf
- For Network Interface resource add `count=2`
- Associate Public IP using `Element Function` and `Splat Expression`
```t
# Create Network Interface
resource "azurerm_network_interface" "myvmnic" {
  count = 2
  name                = "vmnic-${count.index}"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = element(azurerm_public_ip.mypublicip[*].id, count.index)
  }
}
```

## c4-linux-virtual-machine.tf
- For Linux Virtual machine resource add `count=2`
- Associate Network interface to VM using `Element Function` and `Splat Expression`
```t
# Resource: Azure Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "mylinuxvm" {
  count = 2
  name                = "mylinuxvm-${count.index}"
  computer_name       = "devlinux-${count.index}" # Hostname of the VM
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  size                = "Standard_DS1_v2"
  admin_username      = "azureuser"
  network_interface_ids = [element(azurerm_network_interface.myvmnic[*].id, count.index)]
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
  }
  os_disk {
    name = "osdisk${count.index}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    #disk_size_gb = 20
  }
  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
  }
  custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")
}
```


## Execute Terraform Commands
```t
# Change Directory
cd terraform-manifests

# Terraform Initialize
terraform init

# Terraform Apply
terraform apply -auto-approve

## Destroy Terraform Resources
```t
# Destroy Terraform Resources
terraform destroy -auto-approve

```
