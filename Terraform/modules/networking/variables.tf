
variable "vpc_cidr_block" {
  type        = string
  description = "Value for the VPC's CIDR block."
  default     = "10.1.0.0/16"
}

variable "subnet_zone_1" {
  type        = string
  description = "Subnet availability zone."
  default     = "us-east-1a"
}

variable "subnet_zone_2" {
  type        = string
  description = "Subnet availability zone."
  default     = "us-east-1b"
}

variable "subnet_cidr_block_public_1a" {
  type        = string
  description = "Value for the VPC subnet's CIDR block."
  default     = "10.1.0.0/24"
}

variable "subnet_cidr_block_public_1b" {
  type        = string
  description = "Value for the VPC subnet's CIDR block."
  default     = "10.1.1.0/24"
}

variable "subnet_cidr_block_private_1a" {
  type        = string
  description = "Value for the VPC subnet's CIDR block."
  default     = "10.1.2.0/24"
}

variable "subnet_cidr_block_private_1b" {
  type        = string
  description = "Value for the VPC subnet's CIDR block."
  default     = "10.1.3.0/24"
}
