terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.1.0"
    }
  }

  required_version = ">= 1.9.0"
}

provider "azurerm" {
  subscription_id = "9dc50af1-f67d-44f2-8d02-79fe0f028e7d"

  features {}
}
