# Create a Resource Group
resource "azurerm_resource_group" "rg1" {
  name     = "${var.env_name}-Terraform-RG1"
  location = var.location
}

# Create a Virtual Network
resource "azurerm_virtual_network" "vnet1" {
  name                = "First_virtual_network"         # name of virtual network
  address_space       = ["10.10.0.0/16"]                # address_space of virtual network
  location            = var.location                    # location of vnet
  resource_group_name = azurerm_resource_group.rg1.name # resource group in which resource will be deployed
  depends_on          = [azurerm_resource_group.rg1]    # setting up an explicit dependency on resource group
}

# Create a Subnet in Virtual Network
resource "azurerm_subnet" "subnet1" {
  name                 = "First_subnet"                     # name of subnet
  address_prefixes     = ["10.10.1.0/24"]                   # address space of subnet
  virtual_network_name = azurerm_virtual_network.vnet1.name # name of virtual network in which subnet will part of it
  resource_group_name  = azurerm_resource_group.rg1.name    # resource group in which resource will be deployed
  depends_on           = [azurerm_virtual_network.vnet1]    # setting up an explicit dependency on vnet
}

# Create a Subnet in Virtual Network
resource "azurerm_subnet" "subnet2" {
  name                 = "Second_subnet"                    # name of subnet
  address_prefixes     = ["10.10.2.0/24"]                   # address space of subnet
  virtual_network_name = azurerm_virtual_network.vnet1.name # name of virtual network in which subnet will part of it
  resource_group_name  = azurerm_resource_group.rg1.name    # resource group in which resource will be deployed
  depends_on           = [azurerm_virtual_network.vnet1]    # setting up an explicit dependency on vnet
}