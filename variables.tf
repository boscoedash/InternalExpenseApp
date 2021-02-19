variable "resource_group_name" {
  default     = "InternalExpenseApp_Demo"
  description = "Name of the resource group to place App Gateway in."
}
variable "resource_group_location" {
  default     = "USGov Texas"
  description = "Location of the resource group to place App Gateway in."
}
variable "virtual_network_name" {
  default     = "vnt-internal-expense-app"
  description = "Name of the vNet place App Gateway in."
}
variable "virtual_network_address_space" {
  default     = ["10.0.0.0/16"]
  description = "vNet Address Space."
}
variable "ase_subnet_name" {
  default     = "ase-subnet"
  description = "Name of the ASE subnet."
}
variable "ase_subnet_address_space" {
  default     = "10.0.1.0/24"
  description = "subnet Address Space."
}
variable "vm_subnet_name" {
  default     = "vm-subnet"
  description = "Name of the ASE subnet."
}
variable "vm_subnet_address_space" {
  default     = "10.0.2.0/24"
  description = "subnet Address Space."
}
variable "app_service_environment_name" {
  default     = "ase-internal-01"
  description = "Name of the ASE."
}
variable "app_service_plan_name" {
  default     = "asp-isolated-01"
  description = "Name of the ASP."
}
variable "app_service_plan_sku" {
  default     = {
    tier     = "Isolated"
    size     = "small"
  }
  description = "ASP SKU."
}
variable "app_service_name" {
  default     = "expenseweb"
  description = "Name of the ASP."
}
variable "app_service_site_config" {
  default     = {
    always_on                 = null
    app_command_line          = null
    default_documents         = null
    dotnet_framework_version = "v4.0"
    ftps_state                = null
    http2_enabled             = null
    java_version              = null
    java_container            = null
    java_container_version    = null
    local_mysql_enabled       = null
    linux_fx_version          = null
    windows_fx_version        = null
    managed_pipeline_mode     = null
    min_tls_version           = null
    php_version               = null
    python_version            = null
    remote_debugging_version  =  
    scm_type                  = "GitHub"
    use_32_bit_worker_process = null
    websockets_enabled        = null
  }
  description = "ASP SKU."
}
