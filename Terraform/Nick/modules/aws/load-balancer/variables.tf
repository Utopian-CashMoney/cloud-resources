
variable "cashmoney_vpc" {
  type        = any
  description = "Main CashMoney VPC."
}

variable "is_private" {
  description = "Whether or not the load balancer should be internal or not"
  type        = bool
  default     = true
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for the load balancer to use"
}

variable "environment" {
  description = "Environment tag value for resources"
  type        = string
  default     = "def"
}
