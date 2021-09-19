terraform {
  backend "remote" {
    organization = "cashmoney"

    workspaces {
      name = "azure-dev-east"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }

  required_version = ">= 0.13"
}

provider "azurerm" {
  features {}
}
