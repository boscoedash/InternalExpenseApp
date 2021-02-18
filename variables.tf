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
  default     = "10.0.0.0/16"
  description = "vNet Address Space."
}
variable "ase_subnet_name" {
  default     = "ase-subnet"
  description = "Name of the ASE subnet."
}
variable "ase_subnet_address_space" {
  default     = ["10.0.1.0/24"]
  description = "subnet Address Space."
}