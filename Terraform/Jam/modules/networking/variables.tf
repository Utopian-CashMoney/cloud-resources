
variable "vpc_cidr_block" {
  type        = string
  description = "Value for the VPC's CIDR block."
  default     = "10.2.0.0/16"
}

variable "subnet_zone_1" {
  type        = string
  description = "Subnet availability zone."
  default     = "us-east-2a"
}

variable "subnet_zone_2" {
  type        = string
  description = "Subnet availability zone."
  default     = "us-east-2b"
}

variable "subnet_cidr_block_public_2a" {
  type        = string
  description = "Value for the VPC subnet's CIDR block."
  default     = "10.2.0.0/24"
}

variable "subnet_cidr_block_public_2b" {
  type        = string
  description = "Value for the VPC subnet's CIDR block."
  default     = "10.2.1.0/24"
}

variable "subnet_cidr_block_private_2a" {
  type        = string
  description = "Value for the VPC subnet's CIDR block."
  default     = "10.2.2.0/24"
}

variable "subnet_cidr_block_private_2b" {
  type        = string
  description = "Value for the VPC subnet's CIDR block."
  default     = "10.2.3.0/24"
}
