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

module "VirtualNetwork" {
  source                        = "./InfrastructureAsCode/Modules/Terraform/VirtualNetwork"
  virtual_network_name          = var.virtual_network_name
  resource_group_name           = var.resource_group_name
  resource_group_location       = var.resource_group_location
  virtual_network_address_space = var.virtual_network_address_space
}

module "ASESubnet" {
  source               = "./InfrastructureAsCode/Modules/Terraform/Subnet"
  subnet_name          = var.ase_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = module.VirtualNetwork.virtual_network_name
  subnet_address_space = var.ase_subnet_address_space
}

module "VMSubnet" {
  source               = "./InfrastructureAsCode/Modules/Terraform/Subnet"
  subnet_name          = var.vm_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = module.VirtualNetwork.virtual_network_name
  subnet_address_space = var.vm_subnet_address_space
}

module "AppServiceEnvironment" {
  source                       = "./InfrastructureAsCode/Modules/Terraform/AppServiceEnvironment"
  app_service_environment_name = var.app_service_environment_name
  resource_group_name          = var.resource_group_name
  subnet_id                    = module.ASESubnet.subnet_id
}

module "AppServicePlan" {
  source                       = "./InfrastructureAsCode/Modules/Terraform/AppServicePlan"
  app_service_plan_name        = var.app_service_plan_name
  app_service_environment_id   = module.AppServiceEnvironment.id
  location                     = var.resource_group_location
  resource_group_name          = var.resource_group_name
  app_service_plan_sku_map     = var.app_service_plan_sku
}

module "AppService" {
  source                  = "./InfrastructureAsCode/Modules/Terraform/AppService"
  location                = var.resource_group_location
  app_service_name        = var.app_service_name
  resource_group_name     = var.resource_group_name
  app_service_plan_id     = module.AppServicePlan.id
}

 
 
 
