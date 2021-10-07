terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "cashmoney"

    workspaces {
      prefix = "azure-aks-east-"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.77.0"
    }
    # vault = {
    #   source  = "hashicorp/vault"
    #   version = "=2.24.0"
    # }
  }

  required_version = ">= 0.13"
}

# provider "vault" {
#   address = "http://127.0.0.1:8200"
#   token   = null
# }

# data "vault_azure_access_credentials" "azure_creds" {
#   backend                     = "/"
#   role                        = "my-role"
#   validate_creds              = true
#   num_sequential_successes    = 8
#   num_seconds_between_tests   = 7
#   max_cred_validation_seconds = 1200
# }

provider "azurerm" {
  features {}
  # client_id     = data.vault_azure_access_credentials.azure_creds.client_id
  # client_secret = data.vault_azure_access_credentials.azure_creds.client_secret
}
