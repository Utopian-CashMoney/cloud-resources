
variable "resource_group_name" {
  description = "Azure Resource Group name to create resoures in"
  type        = string
}

variable "location" {
  description = "Location in which Virtual Network will be created"
  type        = string
}

variable "network_cidr_block" {
  description = "CIDR Block of Virtual Network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_blocks" {
  description = "Subnet CIDR Blocks"
  type        = list(string)
  default = [
    "10.0.0.0/20",
    "10.0.16.0/20",
    "10.0.32.0/20"
  ]
}
