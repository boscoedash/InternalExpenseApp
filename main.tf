terraform {
 backend "azurerm" {
    resource_group_name   = "Terraform"
    storage_account_name  = "bhlokanatfstate"
    container_name        = "internal-expense-app-tfstate"
    key                   = "terraform.tfstate"
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
