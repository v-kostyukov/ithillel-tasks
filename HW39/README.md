### HW39. Azure basic operations
``` 
Create Microsoft account at https://login.live.com
Create Free Trial subscription at https://portal.azure.com
Launch Azure CLI in any preferred way
Perform a basic authentication for Azure CLI
Using Azure CLI, create resource group, Virtual Network, Subnet and Network Security Group.
Create Service Principal using Azure CLI
Re-authenticate Azure CLI using Service Principal
Provide the list of above commands.
Create the Storage Account in any preferred way.
Get a blank template for Azure Linux VM
Create Centos 7 Linux Virtual Machine of B-type using the custom template deployment. Machine must have UNMANAGED disk.
Publish source template on github
Delete Bastion service (tricky)

Notes:

Avoid using Windows machines, licenses are expensive
Make sure all resources removed on completion.
Don't forget to remove Bastion and CloudShell resources.
```
### Log in to Azure
``` 
$ az login
You have logged in. Now let us find all the subscriptions to which you have access...
```
###  Manage Azure subscription information
``` 
$ az account
```
### Get a list of subscriptions for the logged in account
``` 
$ az account list
```
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW39/img/screen1.png)
### Manage resource groups and template deployments
``` 
$ az group
```
### Create a new resource group
``` 
$ az group create -l northeurope -n TestResourceGroup
```
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW39/img/screen2.png)
### List resource groups
```
$ az group list
{
  "id": "/subscriptions/*****/resourceGroups/TestResourceGroup",
  "location": "northeurope",
  "managedBy": null,
  "name": "TestResourceGroup",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null,
  "type": "Microsoft.Resources/resourceGroups"
}
```
### Create Virtual Network, Subnet 
``` 
$ az network vnet create -g TestResourceGroup -n TestVnet --address-prefix 10.0.0.0/16 --subnet-name TestSubnet --subnet-prefix 10.0.0.0/24
{
  "newVNet": {
    "addressSpace": {
      "addressPrefixes": [
        "10.0.0.0/16"
      ]
    },
    "bgpCommunities": null,
    "ddosProtectionPlan": null,
    "dhcpOptions": {
      "dnsServers": []
    },
    "enableDdosProtection": false,
    "enableVmProtection": null,
    "etag": "W/\"68455846-6877-4516-a94b-923747e2073a\"",
    "id": "/subscriptions/*****/resourceGroups/TestResourceGroup/providers/Microsoft.Network/virtualNetworks/TestVnet",
    "location": "northeurope",
    "name": "TestVnet",
    "provisioningState": "Succeeded",
    "resourceGroup": "TestResourceGroup",
    "resourceGuid": "623c597e-62a5-4ff5-82f4-1a257bf04b9c",
    "subnets": [
      {
        "addressPrefix": "10.0.0.0/24",
        "addressPrefixes": null,
        "delegations": [],
        "etag": "W/\"68455846-6877-4516-a94b-923747e2073a\"",
        "id": "/subscriptions/*****/resourceGroups/TestResourceGroup/providers/Microsoft.
        Network/virtualNetworks/TestVnet/subnets/TestSubnet",
        "ipConfigurationProfiles": null,
        "ipConfigurations": null,
        "name": "TestSubnet",
        "natGateway": null,
        "networkSecurityGroup": null,
        "privateEndpointNetworkPolicies": "Enabled",
        "privateEndpoints": null,
        "privateLinkServiceNetworkPolicies": "Enabled",
        "provisioningState": "Succeeded",
        "purpose": null,
        "resourceGroup": "TestResourceGroup",
        "resourceNavigationLinks": null,
        "routeTable": null,
        "serviceAssociationLinks": null,
        "serviceEndpointPolicies": null,
        "serviceEndpoints": null,
        "type": "Microsoft.Network/virtualNetworks/subnets"
      }
    ],
    "tags": {},
    "type": "Microsoft.Network/virtualNetworks",
    "virtualNetworkPeerings": []
  }
}
```
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW39/img/screen3.png)
### Create Network Security Group
``` 
$ az network nsg create -l northeurope -g TestResourceGroup -n TestNsg
{
  "NewNSG": {
    "defaultSecurityRules": [
      {
        "access": "Allow",
        "description": "Allow inbound traffic from all VMs in VNET",
        "destinationAddressPrefix": "VirtualNetwork",
        "destinationAddressPrefixes": [],
        "destinationApplicationSecurityGroups": null,
        "destinationPortRange": "*",
        "destinationPortRanges": [],
        "direction": "Inbound",
        "etag": "W/\"ed34414f-6f51-4379-bcd0-b58fb91cee1d\"",
        "id": "/subscriptions/*****/resourceGroups/TestResourceGroup/providers/Microsoft.
        Network/networkSecurityGroups/TestNsg/defaultSecurityRules/AllowVnetInBound",
        "name": "AllowVnetInBound",
        "priority": 65000,
        "protocol": "*",
        "provisioningState": "Succeeded",
        "resourceGroup": "TestResourceGroup",
        "sourceAddressPrefix": "VirtualNetwork",
        "sourceAddressPrefixes": [],
        "sourceApplicationSecurityGroups": null,
        "sourcePortRange": "*",
        "sourcePortRanges": [],
        "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
      },
      {
        "access": "Allow",
        "description": "Allow inbound traffic from azure load balancer",
        "destinationAddressPrefix": "*",
        "destinationAddressPrefixes": [],
        "destinationApplicationSecurityGroups": null,
        "destinationPortRange": "*",
        "destinationPortRanges": [],
        "direction": "Inbound",
        "etag": "W/\"ed34414f-6f51-4379-bcd0-b58fb91cee1d\"",
        "id": "/subscriptions/*****/resourceGroups/TestResourceGroup/providers/Microsoft.
        Network/networkSecurityGroups/TestNsg/defaultSecurityRules/AllowAzureLoadBalancerInBound",
        "name": "AllowAzureLoadBalancerInBound",
        "priority": 65001,
        "protocol": "*",
        "provisioningState": "Succeeded",
        "resourceGroup": "TestResourceGroup",
        "sourceAddressPrefix": "AzureLoadBalancer",
        "sourceAddressPrefixes": [],
        "sourceApplicationSecurityGroups": null,
        "sourcePortRange": "*",
        "sourcePortRanges": [],
        "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
      },
      {
        "access": "Deny",
        "description": "Deny all inbound traffic",
        "destinationAddressPrefix": "*",
        "destinationAddressPrefixes": [],
        "destinationApplicationSecurityGroups": null,
        "destinationPortRange": "*",
        "destinationPortRanges": [],
        "direction": "Inbound",
        "etag": "W/\"ed34414f-6f51-4379-bcd0-b58fb91cee1d\"",
        "id": "/subscriptions/*****/resourceGroups/TestResourceGroup/providers/Microsoft.
        Network/networkSecurityGroups/TestNsg/defaultSecurityRules/DenyAllInBound",
        "name": "DenyAllInBound",
        "priority": 65500,
        "protocol": "*",
        "provisioningState": "Succeeded",
        "resourceGroup": "TestResourceGroup",
        "sourceAddressPrefix": "*",
        "sourceAddressPrefixes": [],
        "sourceApplicationSecurityGroups": null,
        "sourcePortRange": "*",
        "sourcePortRanges": [],
        "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
      },
      {
        "access": "Allow",
        "description": "Allow outbound traffic from all VMs to all VMs in VNET",
        "destinationAddressPrefix": "VirtualNetwork",
        "destinationAddressPrefixes": [],
        "destinationApplicationSecurityGroups": null,
        "destinationPortRange": "*",
        "destinationPortRanges": [],
        "direction": "Outbound",
        "etag": "W/\"ed34414f-6f51-4379-bcd0-b58fb91cee1d\"",
        "id": "/subscriptions/*****/resourceGroups/TestResourceGroup/providers/Microsoft.
        Network/networkSecurityGroups/TestNsg/defaultSecurityRules/AllowVnetOutBound",
        "name": "AllowVnetOutBound",
        "priority": 65000,
        "protocol": "*",
        "provisioningState": "Succeeded",
        "resourceGroup": "TestResourceGroup",
        "sourceAddressPrefix": "VirtualNetwork",
        "sourceAddressPrefixes": [],
        "sourceApplicationSecurityGroups": null,
        "sourcePortRange": "*",
        "sourcePortRanges": [],
        "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
      },
      {
        "access": "Allow",
        "description": "Allow outbound traffic from all VMs to Internet",
        "destinationAddressPrefix": "Internet",
        "destinationAddressPrefixes": [],
        "destinationApplicationSecurityGroups": null,
        "destinationPortRange": "*",
        "destinationPortRanges": [],
        "direction": "Outbound",
        "etag": "W/\"ed34414f-6f51-4379-bcd0-b58fb91cee1d\"",
        "id": "/subscriptions/*****/resourceGroups/TestResourceGroup/providers/Microsoft.
        Network/networkSecurityGroups/TestNsg/defaultSecurityRules/AllowInternetOutBound",
        "name": "AllowInternetOutBound",
        "priority": 65001,
        "protocol": "*",
        "provisioningState": "Succeeded",
        "resourceGroup": "TestResourceGroup",
        "sourceAddressPrefix": "*",
        "sourceAddressPrefixes": [],
        "sourceApplicationSecurityGroups": null,
        "sourcePortRange": "*",
        "sourcePortRanges": [],
        "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
      },
      {
        "access": "Deny",
        "description": "Deny all outbound traffic",
        "destinationAddressPrefix": "*",
        "destinationAddressPrefixes": [],
        "destinationApplicationSecurityGroups": null,
        "destinationPortRange": "*",
        "destinationPortRanges": [],
        "direction": "Outbound",
        "etag": "W/\"ed34414f-6f51-4379-bcd0-b58fb91cee1d\"",
        "id": "/subscriptions/59c02ba6-f0cd-4fd1-818b-6042e44da71f/resourceGroups/TestResourceGroup/providers/Microsoft.Network/networkSecurityGroups/TestNsg/defaultSecurityRules/DenyAllOutBound",
        "name": "DenyAllOutBound",
        "priority": 65500,
        "protocol": "*",
        "provisioningState": "Succeeded",
        "resourceGroup": "TestResourceGroup",
        "sourceAddressPrefix": "*",
        "sourceAddressPrefixes": [],
        "sourceApplicationSecurityGroups": null,
        "sourcePortRange": "*",
        "sourcePortRanges": [],
        "type": "Microsoft.Network/networkSecurityGroups/defaultSecurityRules"
      }
    ],
    "etag": "W/\"ed34414f-6f51-4379-bcd0-b58fb91cee1d\"",
    "id": "/subscriptions/*****/resourceGroups/TestResourceGroup/providers/Microsoft.
    Network/networkSecurityGroups/TestNsg",
    "location": "northeurope",
    "name": "TestNsg",
    "networkInterfaces": null,
    "provisioningState": "Succeeded",
    "resourceGroup": "TestResourceGroup",
    "resourceGuid": "2add7f99-f20c-4f33-ab44-eb1ccff7bee6",
    "securityRules": [],
    "subnets": null,
    "tags": null,
    "type": "Microsoft.Network/networkSecurityGroups"
  }
}
```
![screen shot web page](https://github.com/v-kostyukov/ithillel-tasks/blob/master/HW39/img/screen4.png)
