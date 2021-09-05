
variable "cashmoney_vpc" {
  type = any
  description = "Main CashMoney VPC."
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private Subnets of the cashmoney VPC."
}
