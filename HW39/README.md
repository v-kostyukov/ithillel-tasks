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
### Create a service principal
``` 
$ az ad sp create-for-rbac -n ServicePrincipalTest
Changing "ServicePrincipalTest" to a valid URI of "http://ServicePrincipalTest", which is the required format used for service principal names
Creating a role assignment under the scope of "/subscriptions/*****"
  Retrying role assignment creation: 1/36
  Retrying role assignment creation: 2/36
  Retrying role assignment creation: 3/36
  Retrying role assignment creation: 4/36
{
  "appId": "ad8ca6cd-3013-45ad-9f23-eba7a33dbb1a",
  "displayName": "ServicePrincipalTest",
  "name": "http://ServicePrincipalTest",
  "password": "*****",
  "tenant": "*****"
}
```
### List service principal roles
```
$ az role assignment list
[
  {
    "canDelegate": null,
    "id": "/subscriptions/*****/providers/Microsoft.Authorization/roleAssignments/ca590552-fe4b-4bbf-84cb-3b5fb0a02b26",
    "name": "ca590552-fe4b-4bbf-84cb-3b5fb0a02b26",
    "principalId": "a4849370-155b-4a86-8121-3e0beebded9c",
    "principalName": "vitaliy.*****",
    "principalType": "User",
    "roleDefinitionId": "/subscriptions/*****/providers/Microsoft.
    Authorization/roleDefinitions/8e3af657-a8ff-443c-a75c-2fe8c4bcb635",
    "roleDefinitionName": "Owner",
    "scope": "/subscriptions/*****",
    "type": "Microsoft.Authorization/roleAssignments"
  },
  {
    "canDelegate": null,
    "id": "/subscriptions/*****/providers/Microsoft.Authorization/roleAssignments/722c3235-30c4-47c3-89b3-c5c92b8b2ae7",
    "name": "722c3235-30c4-47c3-89b3-c5c92b8b2ae7",
    "principalId": "a3995982-5049-40ca-82e3-17f688c25f1f",
    "principalName": "http://ServicePrincipalTest",
    "principalType": "ServicePrincipal",
    "roleDefinitionId": "/subscriptions/*****/providers/Microsoft.
    Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c",
    "roleDefinitionName": "Contributor",
    "scope": "/subscriptions/*****",
    "type": "Microsoft.Authorization/roleAssignments"
  }
]
```
### Create Storage Account
``` 
az storage account create -n teststorgr --resource-group TestResourceGroup -l northeurope --sku Standard_RAGRS --kind StorageV2
{
  "accessTier": "Hot",
  "azureFilesIdentityBasedAuthentication": null,
  "creationTime": "2021-09-16T20:41:32.944161+00:00",
  "customDomain": null,
  "enableHttpsTrafficOnly": true,
  "encryption": {
    "keySource": "Microsoft.Storage",
    "keyVaultProperties": null,
    "services": {
      "blob": {
        "enabled": true,
        "keyType": "Account",
        "lastEnabledTime": "2021-09-16T20:41:33.053564+00:00"
      },
      "file": {
        "enabled": true,
        "keyType": "Account",
        "lastEnabledTime": "2021-09-16T20:41:33.053564+00:00"
      },
      "queue": null,
      "table": null
    }
  },
  "failoverInProgress": null,
  "geoReplicationStats": null,
  "id": "/subscriptions/*****/resourceGroups/TestResourceGroup/providers/Microsoft.Storage/storageAccounts/teststorgr",
  "identity": null,
  "isHnsEnabled": null,
  "kind": "StorageV2",
  "largeFileSharesState": null,
  "lastGeoFailoverTime": null,
  "location": "northeurope",
  "name": "teststorgr",
  "networkRuleSet": {
    "bypass": "AzureServices",
    "defaultAction": "Allow",
    "ipRules": [],
    "virtualNetworkRules": []
  },
  "primaryEndpoints": {
    "blob": "https://teststorgr.blob.core.windows.net/",
    "dfs": "https://teststorgr.dfs.core.windows.net/",
    "file": "https://teststorgr.file.core.windows.net/",
    "internetEndpoints": null,
    "microsoftEndpoints": null,
    "queue": "https://teststorgr.queue.core.windows.net/",
    "table": "https://teststorgr.table.core.windows.net/",
    "web": "https://teststorgr.z16.web.core.windows.net/"
  },
  "primaryLocation": "northeurope",
  "privateEndpointConnections": [],
  "provisioningState": "Succeeded",
  "resourceGroup": "TestResourceGroup",
  "routingPreference": null,
  "secondaryEndpoints": {
    "blob": "https://teststorgr-secondary.blob.core.windows.net/",
    "dfs": "https://teststorgr-secondary.dfs.core.windows.net/",
    "file": null,
    "internetEndpoints": null,
    "microsoftEndpoints": null,
    "queue": "https://teststorgr-secondary.queue.core.windows.net/",
    "table": "https://teststorgr-secondary.table.core.windows.net/",
    "web": "https://teststorgr-secondary.z16.web.core.windows.net/"
  },
  "secondaryLocation": "westeurope",
  "sku": {
    "name": "Standard_RAGRS",
    "tier": "Standard"
  },
  "statusOfPrimary": "available",
  "statusOfSecondary": "available",
  "tags": {},
  "type": "Microsoft.Storage/storageAccounts"
}
```