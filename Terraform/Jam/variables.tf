
variable "aws_region" {
  type    = string
  default = "us-east-2"
}

variable "ms_cluster_name" {
  type    = string
  default = "cashmoney"
}

variable "ecs_task_execution_role_name" {
  type    = string
  default = "ecsExecutionRole"
}
