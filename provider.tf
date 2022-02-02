terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=>2.90.0"
    }
  }
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}