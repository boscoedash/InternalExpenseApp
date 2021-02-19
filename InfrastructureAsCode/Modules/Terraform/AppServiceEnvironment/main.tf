locals {
  ase_pricing_tier  = var.ase_pricing_tier == null ? {} : var.ase_pricing_tier
  front_end_scale_factor  = var.front_end_scale_factor == null ? {} : var.front_end_scale_factor
  internal_load_balancing_mode  = var.internal_load_balancing_mode == null ? {} : var.internal_load_balancing_mode
  allowed_user_ip_cidrs  = var.allowed_user_ip_cidrs == null ? {} : var.allowed_user_ip_cidrs
}

resource "azurerm_app_service_environment" "app_service_environment" {
  name                         = var.app_service_environment_name
  resource_group_name          = var.resource_group_name
  subnet_id                    = var.subnet_id
  pricing_tier                 = local.ase_pricing_tier
  front_end_scale_factor       = local.front_end_scale_factor
  internal_load_balancing_mode = local.internal_load_balancing_mode
  allowed_user_ip_cidrs        = local.allowed_user_ip_cidrs
}
