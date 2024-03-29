variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the App Service"
}

variable "app_service_plan_name" {
  type        = string
  description = "App Service Plan Name"
}

variable "location" {
  type        = string
  description = "location"
}

variable "kind" {
  type        = string
  description = "The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). Defaults to Windows. Changing this forces a new resource to be created."
  default     = "Windows"
}

variable "maximum_elastic_worker_count" {
  type        = number
  description = "The maximum number of total workers allowed for this ElasticScaleEnabled App Service Plan."
  default     = 2
}

variable "app_service_environment_id" {
  type        = string
  description = "The ID of the App Service Environment where the App Service Plan should be located. Changing forces a new resource to be created."
}

variable "reserved" {
  type        = bool
  description = "Is this App Service Plan Reserved. Defaults to false."
  default     = false
}

variable "per_site_scaling" {
  type        = bool
  description = "Can Apps assigned to this App Service Plan be scaled independently? If set to false apps assigned to this plan will scale to all instances of the plan. Defaults to false."
  default     = false
}

variable "app_service_plan_sku_map" {
  type        = map
  description = "map of sku data."
}
