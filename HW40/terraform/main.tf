resource "azurerm_resource_group" "rg1" {
  name     = "peering-siteb-rg"
  location = "westeurope"
}

resource "azurerm_virtual_network" "vnet-1" {
  name                = "peternetwork1"
  resource_group_name = azurerm_resource_group.rg1.name
  address_space       = ["10.0.1.0/24"]
  location            = "West US"
}

resource "azurerm_virtual_network" "vnet-2" {
  name                = "peternetwork2"
  resource_group_name = azurerm_resource_group.rg1.name
  address_space       = ["10.0.2.0/24"]
  location            = "West US"
}

resource "azurerm_subnet" "subnet-1" {
  name                 = "subnet-1"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet-1.name
  address_prefixes     = ["10.0.1.0/25"]
}

resource "azurerm_subnet" "subnet-2" {
  name                 = "subnet-2"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet-1.name
  address_prefixes     = ["10.0.1.0/25"]
}

resource "azurerm_virtual_network_peering" "example-1" {
  name                      = "peer1to2"
  resource_group_name       = azurerm_resource_group.rg1.name
  virtual_network_name      = azurerm_virtual_network.vnet-1.name
  remote_virtual_network_id = azurerm_virtual_network.vnet-2.id
}

resource "azurerm_virtual_network_peering" "example-2" {
  name                      = "peer2to1"
  resource_group_name       = azurerm_resource_group.rg1.name
  virtual_network_name      = azurerm_virtual_network.vnet-2.name
  remote_virtual_network_id = azurerm_virtual_network.vnet-1.id
}

resource "azurerm_network_security_group" "sg" {
  name                = "acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name

  security_rule {
    name                       = "ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "22"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}