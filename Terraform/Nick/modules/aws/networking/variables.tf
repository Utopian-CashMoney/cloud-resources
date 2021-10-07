
variable "vpc_cidr_block" {
  description = "Value for the VPC's CIDR block."
  type        = string
  default     = "10.1.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of public subnet cidr blocks"
  type        = list(string)
  default     = ["10.1.0.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of private subnet cidr blocks"
  type        = list(string)
  default     = ["10.1.1.0/24"]
}

variable "environment" {
  description = "Environment tag value for resources"
  type        = string
  default     = "def"
}
