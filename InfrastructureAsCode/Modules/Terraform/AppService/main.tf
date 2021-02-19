resource "azurerm_app_service" "app_service" {
  name                    = var.app_service_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  app_service_plan_id     = var.app_service_plan_id
  client_affinity_enabled = var.client_affinity_enabled
  client_cert_enabled     = var.client_cert_enabled
  enabled                 = var.enabled
  https_only              = var.https_only
  tags                    = local.tags
}