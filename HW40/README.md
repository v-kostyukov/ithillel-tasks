### HW40. Terraform for Azure
``` 
Write TF scripts which creates:
1. Resource group
2. 2 VNets
3. 2 subnets (One subnet per VNet)
4. 1 security group
    - Allow 22 port
5. Configure Perring between VNets
6. VM1:
    - VNet 1
    - Subnet 1
    - Public IP: yes
    - DNS "A" record in a private DNS zone
7. VM2:
    - VNet 2
    - Subnet 2
    - Public IP: no
    - DNS "A" record in a private DNS zone
8. Private DNS zone
9. Associate DNS zone with both VNets

The main goal:

1. Created VMs must be allocated in different VNets but, they must be accessible to each other by 22 port
2. One of the VM must have public IP
3. Each VM must be resolvable.
```
### Initialize directory, pull down providers
``` 
terraform init
```
### Format code per HCL canonical standard
``` 
terraform fmt
```
### Validate code for syntax
``` 
terraform validate
```
### Output the deployment plan
``` 
terraform plan
```
### Apply changes
``` 
terraform apply
```
### terraform init
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW40/img/screen1.png)
### terraform validate
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW40/img/screen2.png)
### Output terraform plan
``` 
terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_network_interface.myvm1nic will be created
  + resource "azurerm_network_interface" "myvm1nic" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = false
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "westeurope"
      + mac_address                   = (known after apply)
      + name                          = "myvm1-nic"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "peering-siteb-rg"
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + name                          = "ipconfig1"
          + primary                       = (known after apply)
          + private_ip_address            = (known after apply)
          + private_ip_address_allocation = "dynamic"
          + private_ip_address_version    = "IPv4"
          + public_ip_address_id          = (known after apply)
          + subnet_id                     = (known after apply)
        }
    }

  # azurerm_network_interface.myvm2nic will be created
  + resource "azurerm_network_interface" "myvm2nic" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = false
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "westeurope"
      + mac_address                   = (known after apply)
      + name                          = "myvm2-nic"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "peering-siteb-rg"
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + name                          = "ipconfig2"
          + primary                       = (known after apply)
          + private_ip_address            = (known after apply)
          + private_ip_address_allocation = "dynamic"
          + private_ip_address_version    = "IPv4"
          + subnet_id                     = (known after apply)
        }
    }

  # azurerm_network_security_group.sg1 will be created
  + resource "azurerm_network_security_group" "sg1" {
      + id                  = (known after apply)
      + location            = "westeurope"
      + name                = "acceptanceTestSecurityGroup1"
      + resource_group_name = "peering-siteb-rg"
      + security_rule       = [
          + {
              + access                                     = "Allow"
              + description                                = ""
              + destination_address_prefix                 = "*"
              + destination_address_prefixes               = []
              + destination_application_security_group_ids = []
              + destination_port_range                     = "22"
              + destination_port_ranges                    = []
              + direction                                  = "Inbound"
              + name                                       = "ssh"
              + priority                                   = 100
              + protocol                                   = "Tcp"
              + source_address_prefix                      = ""
              + source_address_prefixes                    = [
                  + "10.0.1.0/25",
                  + "192.168.1.0/25",
                ]
              + source_application_security_group_ids      = []
              + source_port_range                          = "*"
              + source_port_ranges                         = []
            },
        ]
      + tags                = {
          + "environment" = "Production"
        }
    }

  # azurerm_private_dns_zone.bravotest will be created
  + resource "azurerm_private_dns_zone" "bravotest" {
      + id                                                    = (known after apply)
      + max_number_of_record_sets                             = (known after apply)
      + max_number_of_virtual_network_links                   = (known after apply)
      + max_number_of_virtual_network_links_with_registration = (known after apply)
      + name                                                  = "bravotest.tk"
      + number_of_record_sets                                 = (known after apply)
      + resource_group_name                                   = "peering-siteb-rg"

      + soa_record {
          + email         = (known after apply)
          + expire_time   = (known after apply)
          + fqdn          = (known after apply)
          + host_name     = (known after apply)
          + minimum_ttl   = (known after apply)
          + refresh_time  = (known after apply)
          + retry_time    = (known after apply)
          + serial_number = (known after apply)
          + tags          = (known after apply)
          + ttl           = (known after apply)
        }
    }

  # azurerm_private_dns_zone_virtual_network_link.vnl1 will be created
  + resource "azurerm_private_dns_zone_virtual_network_link" "vnl1" {
      + id                    = (known after apply)
      + name                  = "vnl1"
      + private_dns_zone_name = "bravotest.tk"
      + registration_enabled  = false
      + resource_group_name   = "peering-siteb-rg"
      + virtual_network_id    = (known after apply)
    }

  # azurerm_private_dns_zone_virtual_network_link.vnl2 will be created
  + resource "azurerm_private_dns_zone_virtual_network_link" "vnl2" {
      + id                    = (known after apply)
      + name                  = "vnl2"
      + private_dns_zone_name = "bravotest.tk"
      + registration_enabled  = false
      + resource_group_name   = "peering-siteb-rg"
      + virtual_network_id    = (known after apply)
    }

  # azurerm_public_ip.myvm1publicip will be created
  + resource "azurerm_public_ip" "myvm1publicip" {
      + allocation_method       = "Dynamic"
      + fqdn                    = (known after apply)
      + id                      = (known after apply)
      + idle_timeout_in_minutes = 4
      + ip_address              = (known after apply)
      + ip_version              = "IPv4"
      + location                = "westeurope"
      + name                    = "pip1"
      + resource_group_name     = "peering-siteb-rg"
      + sku                     = "Basic"
    }

  # azurerm_resource_group.rg1 will be created
  + resource "azurerm_resource_group" "rg1" {
      + id       = (known after apply)
      + location = "westeurope"
      + name     = "peering-siteb-rg"
    }

  # azurerm_subnet.subnet-1 will be created
  + resource "azurerm_subnet" "subnet-1" {
      + address_prefix                                 = (known after apply)
      + address_prefixes                               = [
          + "10.0.1.0/25",
        ]
      + enforce_private_link_endpoint_network_policies = false
      + enforce_private_link_service_network_policies  = false
      + id                                             = (known after apply)
      + name                                           = "subnet-1"
      + resource_group_name                            = "peering-siteb-rg"
      + virtual_network_name                           = "peternetwork1"
    }

  # azurerm_subnet.subnet-2 will be created
  + resource "azurerm_subnet" "subnet-2" {
      + address_prefix                                 = (known after apply)
      + address_prefixes                               = [
          + "192.168.1.0/25",
        ]
      + enforce_private_link_endpoint_network_policies = false
      + enforce_private_link_service_network_policies  = false
      + id                                             = (known after apply)
      + name                                           = "subnet-2"
      + resource_group_name                            = "peering-siteb-rg"
      + virtual_network_name                           = "peternetwork2"
    }

  # azurerm_virtual_network.vnet-1 will be created
  + resource "azurerm_virtual_network" "vnet-1" {
      + address_space         = [
          + "10.0.1.0/24",
        ]
      + guid                  = (known after apply)
      + id                    = (known after apply)
      + location              = "westus"
      + name                  = "peternetwork1"
      + resource_group_name   = "peering-siteb-rg"
      + subnet                = (known after apply)
      + vm_protection_enabled = false
    }

  # azurerm_virtual_network.vnet-2 will be created
  + resource "azurerm_virtual_network" "vnet-2" {
      + address_space         = [
          + "192.168.1.0/24",
        ]
      + guid                  = (known after apply)
      + id                    = (known after apply)
      + location              = "westus"
      + name                  = "peternetwork2"
      + resource_group_name   = "peering-siteb-rg"
      + subnet                = (known after apply)
      + vm_protection_enabled = false
    }

  # azurerm_virtual_network_peering.vnp-1 will be created
  + resource "azurerm_virtual_network_peering" "vnp-1" {
      + allow_forwarded_traffic      = (known after apply)
      + allow_gateway_transit        = (known after apply)
      + allow_virtual_network_access = true
      + id                           = (known after apply)
      + name                         = "peer1to2"
      + remote_virtual_network_id    = (known after apply)
      + resource_group_name          = "peering-siteb-rg"
      + use_remote_gateways          = (known after apply)
      + virtual_network_name         = "peternetwork1"
    }

  # azurerm_virtual_network_peering.vnp-2 will be created
  + resource "azurerm_virtual_network_peering" "vnp-2" {
      + allow_forwarded_traffic      = (known after apply)
      + allow_gateway_transit        = (known after apply)
      + allow_virtual_network_access = true
      + id                           = (known after apply)
      + name                         = "peer2to1"
      + remote_virtual_network_id    = (known after apply)
      + resource_group_name          = "peering-siteb-rg"
      + use_remote_gateways          = (known after apply)
      + virtual_network_name         = "peternetwork2"
    }

  # azurerm_windows_virtual_machine.vm1 will be created
  + resource "azurerm_windows_virtual_machine" "vm1" {
      + admin_password             = (sensitive value)
      + admin_username             = "adminuser"
      + allow_extension_operations = true
      + computer_name              = (known after apply)
      + enable_automatic_updates   = true
      + extensions_time_budget     = "PT1H30M"
      + id                         = (known after apply)
      + location                   = "westeurope"
      + max_bid_price              = -1
      + name                       = "vm1"
      + network_interface_ids      = (known after apply)
      + patch_mode                 = "AutomaticByOS"
      + priority                   = "Regular"
      + private_ip_address         = (known after apply)
      + private_ip_addresses       = (known after apply)
      + provision_vm_agent         = true
      + public_ip_address          = (known after apply)
      + public_ip_addresses        = (known after apply)
      + resource_group_name        = "peering-siteb-rg"
      + size                       = "Standard_B1s"
      + virtual_machine_id         = (known after apply)
      + zone                       = (known after apply)

      + os_disk {
          + caching                   = "ReadWrite"
          + disk_size_gb              = (known after apply)
          + name                      = "myOsDisk"
          + storage_account_type      = "Standard_LRS"
          + write_accelerator_enabled = false
        }

      + source_image_reference {
          + offer     = "UbuntuServer"
          + publisher = "Canonical"
          + sku       = "18.04-LTS"
          + version   = "latest"
        }
    }

  # azurerm_windows_virtual_machine.vm2 will be created
  + resource "azurerm_windows_virtual_machine" "vm2" {
      + admin_password             = (sensitive value)
      + admin_username             = "adminuser"
      + allow_extension_operations = true
      + computer_name              = (known after apply)
      + enable_automatic_updates   = true
      + extensions_time_budget     = "PT1H30M"
      + id                         = (known after apply)
      + location                   = "westeurope"
      + max_bid_price              = -1
      + name                       = "vm2"
      + network_interface_ids      = (known after apply)
      + patch_mode                 = "AutomaticByOS"
      + priority                   = "Regular"
      + private_ip_address         = (known after apply)
      + private_ip_addresses       = (known after apply)
      + provision_vm_agent         = true
      + public_ip_address          = (known after apply)
      + public_ip_addresses        = (known after apply)
      + resource_group_name        = "peering-siteb-rg"
      + size                       = "Standard_B1s"
      + virtual_machine_id         = (known after apply)
      + zone                       = (known after apply)

      + os_disk {
          + caching                   = "ReadWrite"
          + disk_size_gb              = (known after apply)
          + name                      = "myOsDisk"
          + storage_account_type      = "Standard_LRS"
          + write_accelerator_enabled = false
        }

      + source_image_reference {
          + offer     = "UbuntuServer"
          + publisher = "Canonical"
          + sku       = "18.04-LTS"
          + version   = "latest"
        }
    }

Plan: 16 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + rg_location = "westeurope"
```
### terraform apply
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW40/img/screen3.png)
