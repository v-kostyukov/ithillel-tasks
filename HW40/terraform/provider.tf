terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Create the AzureRM provider in terraform
provider "azurerm" {
  features {}
#  subscription_id = var.subscription_id
#  client_id       = var.client_id
#  client_secret   = var.client_secret
#  tenant_id       = var.tenant_id
}
