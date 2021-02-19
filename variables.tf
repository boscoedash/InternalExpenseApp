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
    scm_type                 = "GitHub"
    dotnet_framework_version = "v4.0"
  }
  description = "ASP SKU."
}
