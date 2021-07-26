
variable "cashmoney_vpc_id" {
  type        = string
  description = "VPC ID of the cashmoney VPC created in the Networking module."
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private Subnets of the cashmoney VPC."
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "Public Subnets of the cashmoney VPC."
}
