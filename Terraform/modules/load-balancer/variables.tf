
variable "cashmoney_vpc" {
  type        = any
  description = "Main CashMoney VPC."
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "Public Subnets of the cashmoney VPC."
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private Subnets of the cashmoney VPC."
}
