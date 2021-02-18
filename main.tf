terraform {
 backend "azurerm" {
    resource_group_name   = ${env.RESOURCE_GROUP_NAME}
    storage_account_name  = ${env.STORAGE_ACCOUNT_NAME}
    container_name        = ${env.CONTAINER_NAME}
    key                   = ${env.ACCOUNT_KEY}
  }
}

provider "azurerm" {
  features {}
}

module "ResourceGroup" {
  source    = "./InfrastructureAsCode/Modules/Terraform/ResourceGroup"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
}
