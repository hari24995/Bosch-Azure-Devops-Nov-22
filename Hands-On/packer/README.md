# Packer
## Why Use Packer?
- Quick and easy to automate the creation and customization of machine images.
- Packer installs and configures software at build time

## Installing Packer
```
sudo apt install -y packer
```

## Packer Template
- The configuration files for Packer Images
- The "packer build" command runs the builds defined in the template, creating the custom images.
- Historically, Packer has used a JSON template for its configuration, but Packer is transitioning to a new template configuration format that uses HCL2

- Refer: ubuntu-test.pkr.hcl

## Builders
  - An array of objects that Packer uses to generate machine images.
  - Builders create temporary Azure resources as Packer builds the source VM based on the template

## Provisioners
  - Can be used to pre-install and configure software within the running VM prior to turning it into a machine image

## Variables
  - Variables block contains any user provided variables that packer uses to create image
  - You can parameterize the packer template by configuring variables
  - Refer: ubuntu-test-var.pkr.hcl

## Running Packer
  - Packer builds the images using the build sub-command followed by a HCL template.
```
packer build .
```


# Hands-on
## Steps to use image with Azure :
 - Create Azure resource group
 - Create Azure credentials
 - Define Packer template
 - Build Packer image
 - Create VM from Azure Image
 - Test VM and NGINX

## Create Azure resource group
 - During the build process, Packer creates temporary Azure resources as it builds the source VM
 - To capture that source VM for use as an image, you must define a resource group
 - The output from the Packer build process is stored in this resource group.
```
az account list
az group create -n myResourceGroup -l eastus
```

## Create Azure credentials
- Packer authenticates with Azure using a service principal
- An Azure service principal is a security identity that you can use with apps, services, and automation tools like Packer
- You control and define the permissions as to what operations the service principal can perform in Azure.
- To authenticate to Azure, you also need to obtain your Azure subscription ID
```
az account show — query "{ subscription_id: id }"
```

- Create Service Principal
```
az ad sp create-for-rbac
```

## Packer Variables
- Next let's update the packer variables file - ubuntu-test-var.pkr.hcl
- Add the service principal details in the file

## Define Packer template
- Before we build our template, let’s get the current Ubuntu Server available in our region
```
az vm image list-skus --location "East US" --offer UbuntuServer --publisher Canonical -o table
```

- Next , we need to create a new template file to create a packer image from the above service principal that we have created.
- Refer ubuntu-test.pkr.hcl

## Build Packer image
```
packer build .
```

## Create VM from Azure Image
- We can now create a VM from the Image that we created above
- We need to specify the image you created with the --image parameter
```
az vm create \
— resource-group myResourceGroup \
— name myVM \
— image myPackerImage \
— admin-username azureuser \
— generate-ssh-keys
```

- To allow web traffic to reach your VM, open port 80 from the Internet.
```
az vm open-port \
— resource-group myResourceGroup \
— name myVM \
— port 80
```

## Test VM and NGINX
- Now , we can check our VM public IP
