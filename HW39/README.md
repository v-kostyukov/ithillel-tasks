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
{
  "id": "/subscriptions/59c02ba6-f0cd-4fd1-818b-6042e44da71f/resourceGroups/TestResourceGroup",
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