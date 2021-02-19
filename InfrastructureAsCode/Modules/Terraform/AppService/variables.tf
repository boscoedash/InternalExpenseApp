variable "app_service_name" {
  type        = string
  description = "The name of the app service"
}

variable "location" {
  type        = string
  description = "The location of the app service"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the App Service"
}

variable "tags" {
  type        = map
  description = "A key-value pair of tags."
  default     = {}
}

variable "app_service_plan_id" {
  type        = string
  description = "The ID of the App Service Plan within which to create this App Service."
}

variable "client_affinity_enabled" {
  type        = bool
  description = "Should the App Service send session affinity cookies, which route client requests in the same session to the same instance?"
  default     = false
}

variable "client_cert_enabled" {
  type        = bool
  description = "A key-value pair of App Settings."
  default     = false
}

variable "enabled" {
  type        = bool
  description = "Is the App Service Enabled?"
  default     = true
}

variable "https_only" {
  type        = bool
  description = "Can the App Service only be accessed via HTTPS? Defaults to false."
  default     = false
}
