resource "azurerm_app_service_plan" "app_service_plan" {
  name                         = var.app_service_plan_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  kind                         = var.kind
  maximum_elastic_worker_count = var.maximum_elastic_worker_count
  app_service_environment_id   = var.app_service_environment_id
  reserved                     = var.reserved
  per_site_scaling             = var.per_site_scaling

  sku {
    tier     = lookup(var.app_service_plan_sku_map, "tier", "Isolated")
    size     = lookup(var.app_service_plan_sku_map, "size")
    capacity = lookup(var.app_service_plan_sku_map, "capacity", 2)
  }
}
