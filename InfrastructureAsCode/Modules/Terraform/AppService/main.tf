locals {

  logs_map                        = var.logs_map == null ? {} : var.logs_map
  site_config_cors_map            = var.site_config_cors_map == null ? {} : var.site_config_cors_map
  identity_map                    = var.identity_map  == null ? {} : var.identity_map
  app_settings_map                = var.app_settings_map  == null ? {} : var.app_settings_map # "APPINSIGHTS_INSTRUMENTATIONKEY" = "${azurerm_application_insights.example.instrumentation_key} for app insghts"
  auth_settings_map               = var.auth_settings_map  == null ? {} : var.auth_settings_map
  active_directory_map            = var.active_directory_map  == null ? {} : var.active_directory_map
  storage_account_map             = var.storage_account_map  == null ? {} : var.storage_account_map
  backup_map                      = var.backup_map  == null ? {} : var.backup_map
  schedule_map                    = var.schedule_map  == null ? {} : var.schedule_map
  connection_string_map           = var.connection_string_map  == null ? {} : var.connection_string_map
  ip_restriction_map              = var.ip_restriction_map == null ? {} : var.ip_restriction_map
}

resource "azurerm_app_service" "app_service" {
  name                    = var.app_service_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  app_service_plan_id     = var.app_service_plan_id
  app_settings            = local.app_settings_map
  client_affinity_enabled = var.client_affinity_enabled
  client_cert_enabled     = var.client_cert_enabled
  enabled                 = var.enabled
  https_only              = var.https_only
  tags                    = local.tags

  auth_settings {
    enabled                        = lookup(local.auth_settings_map, "enabled", null)
    additional_login_params        = lookup(local.auth_settings_map, "additional_login_params", null)
    allowed_external_redirect_urls = lookup(local.auth_settings_map, "allowed_external_redirect_urls", null)
    default_provider               = lookup(local.auth_settings_map, "default_provider", null)
    runtime_version                = lookup(local.auth_settings_map, "runtime_version", null)
    token_refresh_extension_hours  = lookup(local.auth_settings_map, "token_refresh_extension_hours", null)
    token_store_enabled            = lookup(local.auth_settings_map, "token_store_enabled", null)
    unauthenticated_client_action  = lookup(local.auth_settings_map, "unauthenticated_client_action", null)
    issuer                         = lookup(local.auth_settings_map, "issuer", null)

    active_directory {
      client_id         = lookup(local.active_directory_map, "client_id", null)
      client_secret     = lookup(local.active_directory_map, "client_secret", null)
      allowed_audiences = lookup(local.active_directory_map, "client_id", null)
    }
  }

  storage_account {
    name         = lookup(local.storage_account_map, "name", null)
    type         = lookup(local.storage_account_map, "type", null)
    account_name = lookup(local.storage_account_map, "account_name", null)
    share_name   = lookup(local.storage_account_map, "share_name", null)
    access_key   = lookup(local.storage_account_map, "access_key", null)
    mount_path   = lookup(local.storage_account_map, "mount_path", null)
  }

  backup {
    name                = lookup(local.backup_map, "name", null)
    enabled             = lookup(local.backup_map, "enabled", null)
    storage_account_url = lookup(local.backup_map, "storage_account_url", null) 

    schedule {
      frequency_interval       = lookup(local.schedule_map, "frequency_interval", null)
      frequency_unit           = lookup(local.schedule_map, "frequency_unit", null)
      keep_at_least_one_backup = lookup(local.schedule_map, "keep_at_least_one_backup", null)
      retention_period_in_days = lookup(local.schedule_map, "retention_period_in_days", null)
      start_time               = lookup(local.schedule_map, "start_time", null)
    }
  }

  connection_string {
    name  = lookup(local.connection_string_map, "name", null)
    type  = lookup(local.connection_string_map, "type", null)
    value = lookup(local.connection_string_map, "value", null)
  }

  logs {
    application_logs {
      azure_blob_storage {
        level             = lookup(local.logs_map["application_logs_map"]["azure_blob_storage"], "level", "Off")
        sas_url           = lookup(local.logs_map["application_logs_map"]["azure_blob_storage"], "sas_url", null)
        retention_in_days = lookup(local.logs_map["application_logs_map"]["azure_blob_storage"], "retention_in_days", 30)
      }
    }

    http_logs {
      azure_blob_storage {
        sas_url           = lookup(local.logs_map["application_logs_map"]["azure_blob_storage"], "sas_url", null)
        retention_in_days = lookup(local.logs_map["application_logs_map"]["azure_blob_storage"], "retention_in_days", 30)
      }

      file_system {
        retention_in_mb   = lookup(local.logs_map["http_logs_map"]["file_system"], "retention_in_mb", null)
        retention_in_days = lookup(local.logs_map["http_logs_map"]["file_system"], "retention_in_days", 30)
      }
    }
  }

  site_config {
    always_on                 = lookup(var.site_config_map, "always_on", false)
    app_command_line          = lookup(var.site_config_map, "sapp_command_line", null)
    default_documents         = lookup(var.site_config_map, "default_documents", null)
    dotnet_framework_version  = lookup(var.site_config_map, "dotnet_framework_version", "v4.0")
    ftps_state                = lookup(var.site_config_map, "ftps_state", null)
    http2_enabled             = lookup(var.site_config_map, "http2_enabled", false)
    java_version              = lookup(var.site_config_map, "java_version", null)
    java_container            = lookup(var.site_config_map, "java_container", null)
    java_container_version    = lookup(var.site_config_map, "java_container_version", null)
    local_mysql_enabled       = lookup(var.site_config_map, "local_mysql_enabled", null)
    linux_fx_version          = lookup(var.site_config_map, "linux_fx_version", null)
    windows_fx_version        = lookup(var.site_config_map, "windows_fx_version", null)
    managed_pipeline_mode     = lookup(var.site_config_map, "managed_pipeline_version", null)
    min_tls_version           = lookup(var.site_config_map, "min_tls_version ", null)
    php_version               = lookup(var.site_config_map, "php_version", null)
    python_version            = lookup(var.site_config_map, "python_version", null)
    remote_debugging_version  = lookup(var.site_config_map, "remote_debugging_version", null)
    scm_type                  = lookup(var.site_config_map, "scm_type", null)
    use_32_bit_worker_process = lookup(var.site_config_map, "use_32_bit_worker_process", null)
    websockets_enabled        = lookup(var.site_config_map, "websockets_enabled", null)

    dynamic "ip_restriction" {
      for_each = local.ip_restriction_map

      content {
        ip_address                = lookup(ip_restriction, "ip_address", null)
        virtual_network_subnet_id = lookup(ip_restriction, "virtual_network_subnet_id", null)
      }
    }

    cors {
      allowed_origins     = lookup(local.site_config_cors_map, "allowed_origins", "*")
      support_credentials = lookup(local.site_config_cors_map, "support_credentials", null)
    }
  }

  identity {
    type         = lookup(local.identity_map, "type", null)
    identity_ids = lookup(local.identity_map, "identity_ids", [])
  }
}