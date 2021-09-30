# Define the Azure resource group
resource "azurerm_resource_group" "rg1" {
  name     = "peering-siteb-rg"
  location = "westeurope"
}

# Define a virtual network vnet-1
resource "azurerm_virtual_network" "vnet-1" {
  name                = "peternetwork1"
  resource_group_name = azurerm_resource_group.rg1.name
  address_space       = ["10.0.1.0/24"]
  location            = "West US"
}

# Define a virtual network vnet-2
resource "azurerm_virtual_network" "vnet-2" {
  name                = "peternetwork2"
  resource_group_name = azurerm_resource_group.rg1.name
  address_space       = ["192.168.1.0/24"]
  location            = "West US"
}

# Define a subnet 1
resource "azurerm_subnet" "subnet-1" {
  name                 = "subnet-1"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet-1.name
  address_prefixes     = ["10.0.1.0/25"]
}

# Define a subnet 2
resource "azurerm_subnet" "subnet-2" {
  name                 = "subnet-2"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet-2.name
  address_prefixes     = ["192.168.1.0/25"]
}

# Define a virtual network peering vnp-1
resource "azurerm_virtual_network_peering" "vnp-1" {
  name                      = "peer1to2"
  resource_group_name       = azurerm_resource_group.rg1.name
  virtual_network_name      = azurerm_virtual_network.vnet-1.name
  remote_virtual_network_id = azurerm_virtual_network.vnet-2.id
}

# Define a virtual network peering vnp-2
resource "azurerm_virtual_network_peering" "vnp-2" {
  name                      = "peer2to1"
  resource_group_name       = azurerm_resource_group.rg1.name
  virtual_network_name      = azurerm_virtual_network.vnet-2.name
  remote_virtual_network_id = azurerm_virtual_network.vnet-1.id
}

# Define a security group sg1
resource "azurerm_network_security_group" "sg1" {
  name                = "acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name

  security_rule {
    name                       = "ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefixes      = ["10.0.1.0/25", "192.168.1.0/25"]
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}

# Define a new public IP address
resource "azurerm_public_ip" "myvm1publicip" {
  name = "pip1"
  location = "westeurope"
  resource_group_name = azurerm_resource_group.rg1.name
  allocation_method = "Dynamic"
  sku = "Basic"
}

# Define a Network Interface for our VM 1
resource "azurerm_network_interface" "myvm1nic" {
  name = "myvm1-nic"
  location = "westeurope"
  resource_group_name = azurerm_resource_group.rg1.name

  ip_configuration {
    name = "ipconfig1"
    subnet_id = azurerm_subnet.subnet-1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.myvm1publicip.id
  }
}

# Define the Virtual Machine 1
resource "azurerm_windows_virtual_machine" "vm1" {
  name                  = "vm1"
  location              = "westeurope"
  resource_group_name   = azurerm_resource_group.rg1.name
  network_interface_ids = [azurerm_network_interface.myvm1nic.id]
  size                  = "Standard_B1s"
  admin_username        = "adminuser"
  admin_password        = "Password123!"

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    name              = "myOsDisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

# Define a Network Interface for our VM 2
resource "azurerm_network_interface" "myvm2nic" {
  name = "myvm2-nic"
  location = "westeurope"
  resource_group_name = azurerm_resource_group.rg1.name

  ip_configuration {
    name = "ipconfig2"
    subnet_id = azurerm_subnet.subnet-2.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Define the Virtual Machine 2
resource "azurerm_windows_virtual_machine" "vm2" {
  name                  = "vm2"
  location              = "westeurope"
  resource_group_name   = azurerm_resource_group.rg1.name
  network_interface_ids = [azurerm_network_interface.myvm2nic.id]
  size                  = "Standard_B1s"
  admin_username        = "adminuser"
  admin_password        = "Password123!"

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    name              = "myOsDisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

# Define the private DNS zone
resource "azurerm_private_dns_zone" "bravotest" {
  name                = "bravotest.tk"
  resource_group_name = azurerm_resource_group.rg1.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "vnl1" {
  name                  = "vnl1"
  resource_group_name   = azurerm_resource_group.rg1.name
  private_dns_zone_name = azurerm_private_dns_zone.bravotest.name
  virtual_network_id    = azurerm_virtual_network.vnet-1.id
}

resource "azurerm_private_dns_zone_virtual_network_link" "vnl2" {
  name                  = "vnl2"
  resource_group_name   = azurerm_resource_group.rg1.name
  private_dns_zone_name = azurerm_private_dns_zone.bravotest.name
  virtual_network_id    = azurerm_virtual_network.vnet-2.id
}