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

variable "service_name" {
  type        = string
  description = "Name used for resources created for cluster and services."
}

variable "cluster_id" {
  type        = string
  description = "ECS Cluster ID to run services in."
}

variable "task_count" {
  type        = number
  description = "ECS Service task desired count."
  default     = 1
}

variable "container_port" {
  type        = number
  description = "Port to run container on."
}

variable "task_execution_role_arn" {
  type        = string
  description = "Task execution role ARN."
}

variable "task_cpu" {
  type        = number
  description = "Task CPU usage."
  default     = 256
}

variable "task_memory" {
  type        = number
  description = "Task memory usage."
  default     = 512
}

variable "alb_arn" {
  type        = string
  description = "Application load balancer ARN."
}
