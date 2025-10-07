remote_state {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-tfstate-dev"
    storage_account_name = "saminfinstate033"
    container_name       = "terraform"
    key                  = "minfin-foundation/${path_relative_to_include()}/terraform.tfstate"
  }
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    terraform {
      backend "azurerm" {}
    }
  EOF
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    provider "azurerm" {
      features {}
      subscription_id = "df511b27-65f4-4ea0-91b4-8bec93f68dd5"
    }
  EOF
}




